package cn.bugstack.trigger.api.dto;

import lombok.Data;

/**
 * @description 用户中奖记录请求对象
 */
@Data
public class UserAwardRecordRequestDTO {

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 查询条数（可选，默认10条）
     */
    private Integer limit;

}
