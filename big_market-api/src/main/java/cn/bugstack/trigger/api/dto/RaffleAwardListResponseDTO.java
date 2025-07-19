package cn.bugstack.trigger.api.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @description 抽奖奖品列表，应答对象
 * @create 2024-02-14 09:43
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class   RaffleAwardListResponseDTO {

    // 奖品ID
    private Integer awardId;
    // 奖品标题
    private String awardTitle;
    // 奖品副标题【抽奖1次后解锁】
    private String awardSubtitle;
    // 排序编号
    private Integer sort;
    //奖品次数规则 - 抽奖N次后解锁，未配置则为空
    private Integer awardRuleLockCount;
    //奖品是否解锁 - true 已解锁、false未解锁
    private  boolean isAwardUnlock;
    //待解锁次数 - 规则的抽奖N次解锁-用户已经抽奖次数
    private Integer waitUnlockCount;

}
