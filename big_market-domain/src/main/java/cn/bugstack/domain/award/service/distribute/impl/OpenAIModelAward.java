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

/**
 * @description OpenAI模型奖品分发服务
 */
@Slf4j
@Component("openai_model")
public class OpenAIModelAward implements IDistributeAward {

    @Resource
    private IAwardRepository repository;

    @Override
    public void giveOutPrizes(DistributeAwardEntity distributeAwardEntity) {
        try {
            // 查询奖品配置「优先走透传的奖品配置」
            String awardConfig = distributeAwardEntity.getAwardConfig();
            if (StringUtils.isBlank(awardConfig)) {
                awardConfig = repository.queryAwardConfig(distributeAwardEntity.getAwardId());
            }

            // 奖品配置格式为模型名称，如：gpt-4、dall-e-2、dall-e-3
            // 或者多个模型用逗号分隔：gpt-4,dall-e-2,dall-e-3
            String modelConfig = parseModelConfig(awardConfig);

            // 构建聚合对象
            UserAwardRecordEntity userAwardRecordEntity = GiveOutPrizesAggregate.buildDistributeUserAwardRecordEntity(
                    distributeAwardEntity.getUserId(),
                    distributeAwardEntity.getOrderId(),
                    distributeAwardEntity.getAwardId(),
                    AwardStateVO.complete
            );

            // 创建用户积分奖品实体（用于记录授予的模型权限）
            UserCreditAwardEntity userCreditAwardEntity = GiveOutPrizesAggregate.buildUserCreditAwardEntity(
                    distributeAwardEntity.getUserId(),
                    BigDecimal.ONE
            );

            GiveOutPrizesAggregate giveOutPrizesAggregate = new GiveOutPrizesAggregate();
            giveOutPrizesAggregate.setUserId(distributeAwardEntity.getUserId());
            giveOutPrizesAggregate.setUserAwardRecordEntity(userAwardRecordEntity);
            giveOutPrizesAggregate.setUserCreditAwardEntity(userCreditAwardEntity);

            // 存储发奖对象
            repository.saveGiveOutPrizesAggregate(giveOutPrizesAggregate);

            log.info("OpenAI模型奖品发放完成 userId:{} orderId:{} model:{}",
                    distributeAwardEntity.getUserId(),
                    distributeAwardEntity.getOrderId(),
                    modelConfig);
        } catch (Exception e) {
            log.error("OpenAI模型奖品发放失败 userId:{} orderId:{}",
                    distributeAwardEntity.getUserId(),
                    distributeAwardEntity.getOrderId(), e);
            throw e;
        }
    }

    /**
     * 解析模型配置
     * 如果是多个模型（逗号分隔），随机选择一个
     */
    private String parseModelConfig(String awardConfig) {
        if (StringUtils.isBlank(awardConfig)) {
            return "gpt-4"; // 默认模型
        }

        String[] models = awardConfig.split(Constants.SPLIT);
        if (models.length == 1) {
            return models[0];
        }

        // 多个模型随机选择一个
        int randomIndex = (int) (Math.random() * models.length);
        return models[randomIndex].trim();
    }
}
