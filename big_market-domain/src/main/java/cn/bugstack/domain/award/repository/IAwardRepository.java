package cn.bugstack.domain.award.repository;

import cn.bugstack.domain.award.model.aggregate.GiveOutPrizesAggregate;
import cn.bugstack.domain.award.model.aggregate.UserAwardRecordAggregate;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;

import java.util.List;

/**
 * 奖品仓储服务
 */
public interface IAwardRepository {

    void saveUserAwardRecord(UserAwardRecordAggregate userAwardRecordAggregate);

    /**
     * 批量保存用户中奖记录（十连抽使用）
     * @param userAwardRecordAggregates 中奖记录聚合列表
     */
    void batchSaveUserAwardRecord(List<UserAwardRecordAggregate> userAwardRecordAggregates);

    String queryAwardConfig(Integer awardId);

    void saveGiveOutPrizesAggregate(GiveOutPrizesAggregate giveOutPrizesAggregate);

    String queryAwardKey(Integer awardId);

    /**
     * 查询用户最近N次中奖记录
     * @param userId 用户ID
     * @param limit 查询条数
     * @return 中奖记录实体列表
     */
    List<UserAwardRecordEntity> queryUserAwardRecordList(String userId, int limit);
}
