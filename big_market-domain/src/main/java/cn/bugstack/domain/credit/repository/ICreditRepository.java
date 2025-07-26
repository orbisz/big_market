package cn.bugstack.domain.credit.repository;

import cn.bugstack.domain.credit.model.aggregate.TradeAggregate;

/**
 * @description 用户积分仓储
 */
public interface ICreditRepository {

    void saveUserCreditTradeOrder(TradeAggregate tradeAggregate);

}
