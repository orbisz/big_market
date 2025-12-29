package cn.bugstack.domain.award.service;

import cn.bugstack.domain.award.model.entity.DistributeAwardEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;

import java.util.List;

/**
 * 奖品服务接口
 */
public interface IAwardService {

    void saveUserAwardRecord(UserAwardRecordEntity userAwardRecordEntity);

    /**
     * 批量保存用户中奖记录（十连抽使用）
     * @param userAwardRecordEntities 中奖记录列表
     */
    void batchSaveUserAwardRecord(List<UserAwardRecordEntity> userAwardRecordEntities);

    /**
     * 配送发货奖品
     */
    void distributeAward(DistributeAwardEntity distributeAwardEntity);

}
