package cn.bugstack.domain.strategy.service.armory;
/**
 * @author orbisz
 * @description 策略装配库(兵工厂)，负责初始化策略计算
 * @create 2023-12-23 09:44
 */

public interface IStrategyArmory {
    /**
     * 装配抽奖策略配置【触发的时机可以为活动审核通过后进行调用】
     * @param strategyId
     * @return
     */
    boolean assembleLotteryStrategy(Long strategyId);


}
