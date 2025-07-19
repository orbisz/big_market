package cn.bugstack.domain.strategy.service;

import java.util.Map;

/**
 * 抽奖规则接口
 */
public interface IRaffleRule {
    /**
     *
     * @return
     */
    Map<String, Integer> queryAwardRuleLockCount(String[] treeIds);
}
