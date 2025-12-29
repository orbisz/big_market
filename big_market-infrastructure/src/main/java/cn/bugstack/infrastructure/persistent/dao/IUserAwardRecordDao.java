package cn.bugstack.infrastructure.persistent.dao;

import cn.bugstack.infrastructure.persistent.po.UserAwardRecord;
import cn.bugstack.middleware.db.router.annotation.DBRouterStrategy;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户中奖记录表
 */
@Mapper
@DBRouterStrategy(splitTable = true)
public interface IUserAwardRecordDao {

    void insert(UserAwardRecord userAwardRecord);

    /**
     * 批量插入中奖记录（十连抽使用）
     * @param recordList 中奖记录列表
     */
    void batchInsert(@Param("recordList") List<UserAwardRecord> recordList);

    int updateAwardRecordCompletedState(UserAwardRecord userAwardRecordReq);
}

