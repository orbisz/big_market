package cn.bugstack.domain.activity.model.entity;

import cn.bugstack.domain.activity.model.valobj.UserRaffleOrderStateVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * @description 用户十连抽订单聚合实体对象
 * 该实体不直接持久化，仅用于流程封装；实际持久化的是 10 条 UserRaffleOrderEntity 记录
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserTenRaffleOrderEntity {

    /** 用户ID */
    private String userId;

    /** 活动ID */
    private Long activityId;

    /** 活动名称 */
    private String activityName;

    /** 抽奖策略ID */
    private Long strategyId;

    /** 10 个唯一订单 ID */
    private List<String> orderIds;

    /** 下单时间 */
    private Date orderTime;

    /** 订单状态；create-创建、used-已使用、cancel-已作废 */
    private UserRaffleOrderStateVO orderState;

    /** 结束时间 */
    private Date endDateTime;

    /** 10 个单独的订单实体 */
    private List<UserRaffleOrderEntity> orderEntities;

}
