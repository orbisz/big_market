package cn.bugstack.trigger.api.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @description 抽奖奖品列表，请求对象
 * @create 2024-02-14 09:46
 */
@Data
public class RaffleAwardListRequestDTO implements Serializable {

    // 抽奖策略ID
    private Long strategyId;
    //活动ID
    private Long activityId;
    //用户ID
    private String userId;

}
