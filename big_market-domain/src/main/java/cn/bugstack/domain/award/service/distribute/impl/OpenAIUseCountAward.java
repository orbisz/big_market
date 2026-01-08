package cn.bugstack.domain.award.service.distribute.impl;

import cn.bugstack.domain.award.model.aggregate.GiveOutPrizesAggregate;
import cn.bugstack.domain.award.model.entity.DistributeAwardEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;
import cn.bugstack.domain.award.model.entity.UserCreditAwardEntity;
import cn.bugstack.domain.award.model.valobj.AwardStateVO;
import cn.bugstack.domain.award.repository.IAwardRepository;
import cn.bugstack.domain.award.service.distribute.IDistributeAward;
import cn.bugstack.types.common.Constants;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.MathContext;

/**
 * @description OpenAI使用次数奖品服务
 */
@Slf4j
@Component("openai_use_count")
public class OpenAIUseCountAward implements IDistributeAward {

    @Resource
    private IAwardRepository repository;

    @Override
    public void giveOutPrizes(DistributeAwardEntity distributeAwardEntity) {
        try {
            // 查询奖品ID 「优先走透传的随机积分奖品配置」
            String awardConfig = distributeAwardEntity.getAwardConfig();
            if (StringUtils.isBlank(awardConfig)) {
                awardConfig = repository.queryAwardConfig(distributeAwardEntity.getAwardId());
            }

            // 解析奖品配置，格式可能是范围值，如 "1,5" 表示增加1-5次使用次数
            BigDecimal openaiUseCount = parseAwardConfig(awardConfig);

            // 构建聚合对象
            UserAwardRecordEntity userAwardRecordEntity = GiveOutPrizesAggregate.buildDistributeUserAwardRecordEntity(
                    distributeAwardEntity.getUserId(),
                    distributeAwardEntity.getOrderId(),
                    distributeAwardEntity.getAwardId(),
                    AwardStateVO.complete
            );

            // 创建用户积分奖品实体（用于记录增加的OpenAI使用次数）
            UserCreditAwardEntity userCreditAwardEntity = GiveOutPrizesAggregate.buildUserCreditAwardEntity(
                    distributeAwardEntity.getUserId(), 
                    openaiUseCount
            );

            GiveOutPrizesAggregate giveOutPrizesAggregate = new GiveOutPrizesAggregate();
            giveOutPrizesAggregate.setUserId(distributeAwardEntity.getUserId());
            giveOutPrizesAggregate.setUserAwardRecordEntity(userAwardRecordEntity);
            giveOutPrizesAggregate.setUserCreditAwardEntity(userCreditAwardEntity);

            // 存储发奖对象
            repository.saveGiveOutPrizesAggregate(giveOutPrizesAggregate);

            log.info("OpenAI使用次数奖品发放完成 userId:{} orderId:{} useCount:{}", 
                    distributeAwardEntity.getUserId(), 
                    distributeAwardEntity.getOrderId(),
                    openaiUseCount);
        } catch (Exception e) {
            log.error("OpenAI使用次数奖品发放失败 userId:{} orderId:{}", 
                    distributeAwardEntity.getUserId(), 
                    distributeAwardEntity.getOrderId(), e);
            throw e;
        }
    }

    private BigDecimal parseAwardConfig(String awardConfig) {
        if (StringUtils.isBlank(awardConfig)) {
            // 默认增加1次使用次数
            return BigDecimal.ONE;
        }

        String[] configParts = awardConfig.split(Constants.SPLIT);
        if (configParts.length == 1) {
            // 单个数值
            try {
                return new BigDecimal(configParts[0]);
            } catch (NumberFormatException e) {
                log.warn("奖品配置格式错误，使用默认值1: {}", awardConfig);
                return BigDecimal.ONE;
            }
        } else if (configParts.length == 2) {
            // 范围值，随机取一个值
            try {
                BigDecimal min = new BigDecimal(configParts[0]);
                BigDecimal max = new BigDecimal(configParts[1]);
                return generateRandom(min, max);
            } catch (NumberFormatException e) {
                log.warn("奖品配置格式错误，使用默认值1: {}", awardConfig);
                return BigDecimal.ONE;
            }
        } else {
            log.warn("奖品配置格式错误，使用默认值1: {}", awardConfig);
            return BigDecimal.ONE;
        }
    }

    private BigDecimal generateRandom(BigDecimal min, BigDecimal max) {
        if (min.equals(max)) return min;
        BigDecimal randomBigDecimal = min.add(BigDecimal.valueOf(Math.random()).multiply(max.subtract(min)));
        return randomBigDecimal.round(new MathContext(3));
    }
}