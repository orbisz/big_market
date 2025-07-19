package cn.bugstack.domain.strategy.service.armory;

import java.util.Date;

/**
 * 策略抽奖调度
 */
public interface IStrategyDispatch {
    /**
     * 获取抽奖策略装配的随机结果
     * @param strategyId
     * @return
     */
    Integer getRandomAwardId(Long strategyId);

    Integer getRandomAwardId(Long strategyId,String ruleWeightValue);

    Integer getRandomAwardId(String key);

    /**
     *
     * @param strategyId 策略ID
     * @param awardId 奖品ID
     * @param endDateTime 结束时间
     * @return
     */
    Boolean subtractionAwardStock(Long strategyId, Integer awardId, Date endDateTime);
}
