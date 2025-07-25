package cn.bugstack.domain.activity.service;

import cn.bugstack.domain.activity.model.valobj.ActivitySkuStockKeyVO;

import java.util.List;

/**
 * @description 抽奖活动SKU库存服务
 */
public interface IRaffleActivitySkuStockService {

    /**
     * 获取活动sku库存消耗队列
     *
     * @return 奖品库存Key信息
     * @throws InterruptedException 异常
     */
    ActivitySkuStockKeyVO takeQueueValue() throws InterruptedException;
    //ActivitySkuStockKeyVO takeQueueValue(Long sku) throws InterruptedException;

    /**
     * 清空队列
     */
    void clearQueueValue();
    //void clearQueueValue(Long sku);

    /**
     * 延迟队列 + 任务趋势更新活动sku库存
     *
     * @param sku 活动商品
     */
    void updateActivitySkuStock(Long sku);

    /**
     * 缓存库存以消耗完毕，清空数据库库存
     *
     * @param sku 活动商品
     */
    void clearActivitySkuStock(Long sku);

    /**
     * 查询所有的sku
     * @return sku编号列表
     */
    //List<Long> querySkuList();


}
