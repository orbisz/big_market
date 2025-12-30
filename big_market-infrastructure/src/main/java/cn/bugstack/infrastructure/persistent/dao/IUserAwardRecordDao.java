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

    /**
     * 查询用户最近N次中奖记录
     * @param userId 用户ID
     * @param limit 查询条数
     * @return 中奖记录列表
     */
    List<UserAwardRecord> queryUserAwardRecordList(@Param("userId") String userId, @Param("limit") int limit);
}

