package cn.bugstack.trigger.api.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 活动十连抽响应对象
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ActivityTenDrawResponseDTO {

    /**
     * 十连抽结果列表
     */
    private List<DrawResult> drawResults;

    /**
     * 单次抽奖结果
     */
    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class DrawResult {
        /**
         * 订单ID
         */
        private String orderId;

        /**
         * 奖品ID
         */
        private Integer awardId;

        /**
         * 奖品标题
         */
        private String awardTitle;

        /**
         * 排序编号【策略奖品配置的奖品顺序编号】
         */
        private Integer awardIndex;
    }

}
