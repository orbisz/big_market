package cn.bugstack.domain.award.adapter.port;

import java.io.IOException;

/**
 * @description 奖品对接接口
 */
public interface IAwardPort {

    void adjustAmount(String userId, Integer increaseQuota) throws Exception;

}
