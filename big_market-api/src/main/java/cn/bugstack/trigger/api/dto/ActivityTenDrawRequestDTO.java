package cn.bugstack.trigger.api.dto;

import lombok.Data;

/**
 * 活动十连抽请求对象
 */
@Data
public class ActivityTenDrawRequestDTO {

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 活动ID
     */
    private Long activityId;

}
