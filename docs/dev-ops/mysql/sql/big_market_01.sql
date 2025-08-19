# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 5.6.39)
# 数据库: big_market_01
# 生成时间: 2024-06-22 04:20:08 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE database if NOT EXISTS `big_market_01` default character set utf8mb4;
use `big_market_01`;

# 转储表 raffle_activity_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account`;

CREATE TABLE `raffle_activity_account` (
                                           `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                           `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                           `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                           `total_count` int(8) NOT NULL COMMENT '总次数',
                                           `total_count_surplus` int(8) NOT NULL COMMENT '总次数-剩余',
                                           `day_count` int(8) NOT NULL COMMENT '日次数',
                                           `day_count_surplus` int(8) NOT NULL COMMENT '日次数-剩余',
                                           `month_count` int(8) NOT NULL COMMENT '月次数',
                                           `month_count_surplus` int(8) NOT NULL COMMENT '月次数-剩余',
                                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           PRIMARY KEY (`id`),
                                           UNIQUE KEY `uq_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表';

LOCK TABLES `raffle_activity_account` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account` DISABLE KEYS */;

INSERT INTO `raffle_activity_account` (`id`, `user_id`, `activity_id`, `total_count`, `total_count_surplus`, `day_count`, `day_count_surplus`, `month_count`, `month_count_surplus`, `create_time`, `update_time`)
VALUES
    (3,'zxy',100301,1188,1161,1188,1161,1188,1161,'2024-03-23 16:38:57','2024-06-22 11:11:02'),
    (4,'12345',100301,10,10,10,10,10,10,'2024-05-01 15:28:50','2024-05-01 15:28:50'),
    (5,'liergou',100301,20,6,20,6,20,6,'2024-05-04 15:30:21','2024-05-04 15:34:10'),
    (6,'liergou2',100301,100,86,100,86,100,86,'2024-05-04 15:35:52','2024-05-04 15:37:37'),
    (7,'user003',100301,100,98,100,98,100,98,'2024-05-25 10:52:19','2024-05-25 10:54:30'),
    (8,'zxy26',100301,1,1,1,1,1,1,'2024-06-22 10:22:35','2024-06-22 10:22:35');

/*!40000 ALTER TABLE `raffle_activity_account` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_account_day
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account_day`;

CREATE TABLE `raffle_activity_account_day` (
                                               `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                               `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                               `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                               `day` varchar(10) NOT NULL COMMENT '日期（yyyy-mm-dd）',
                                               `day_count` int(8) NOT NULL COMMENT '日次数',
                                               `day_count_surplus` int(8) NOT NULL COMMENT '日次数-剩余',
                                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                               `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                               PRIMARY KEY (`id`),
                                               UNIQUE KEY `uq_user_id_activity_id_day` (`user_id`,`activity_id`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表-日次数';

LOCK TABLES `raffle_activity_account_day` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account_day` DISABLE KEYS */;

INSERT INTO `raffle_activity_account_day` (`id`, `user_id`, `activity_id`, `day`, `day_count`, `day_count_surplus`, `create_time`, `update_time`)
VALUES
    (2,'zxy',100301,'2024-04-05',45,44,'2024-04-05 17:10:31','2024-04-05 17:10:31'),
    (3,'zxy',100301,'2024-04-08',45,44,'2024-04-08 22:52:47','2024-04-08 22:52:47'),
    (4,'zxy',100301,'2024-04-13',45,23,'2024-04-13 11:44:10','2024-04-20 10:51:09'),
    (7,'zxy',100301,'2024-04-20',45,13,'2024-04-20 16:50:38','2024-04-20 16:50:38'),
    (11,'zxy',100301,'2024-05-01',60,40,'2024-05-01 14:51:45','2024-05-01 17:45:10'),
    (12,'zxy',100301,'2024-05-03',90,86,'2024-05-03 09:00:28','2024-05-03 13:28:42'),
    (13,'zxy',100301,'2024-05-04',160,131,'2024-05-04 09:32:02','2024-05-04 15:29:56'),
    (14,'liergou',100301,'2024-05-04',20,6,'2024-05-04 15:30:36','2024-05-04 15:34:10'),
    (15,'liergou2',100301,'2024-05-04',100,86,'2024-05-04 15:35:56','2024-05-04 15:37:37'),
    (16,'user003',100301,'2024-05-25',100,98,'2024-05-25 10:53:19','2024-05-25 10:54:30'),
    (17,'zxy',100301,'2024-05-30',160,154,'2024-05-30 07:24:01','2024-05-30 08:02:18'),
    (18,'zxy',100301,'2024-06-09',660,659,'2024-06-09 16:39:17','2024-06-09 18:44:43'),
    (19,'zxy',100301,'2024-06-10',660,637,'2024-06-10 08:16:55','2024-06-10 09:36:26'),
    (20,'zxy',100301,'2024-06-15',1160,1157,'2024-06-15 20:02:16','2024-06-15 20:19:36');

/*!40000 ALTER TABLE `raffle_activity_account_day` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_account_month
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account_month`;

CREATE TABLE `raffle_activity_account_month` (
                                                 `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                 `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                                 `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                                 `month` varchar(7) NOT NULL COMMENT '月（yyyy-mm）',
                                                 `month_count` int(8) NOT NULL COMMENT '月次数',
                                                 `month_count_surplus` int(8) NOT NULL COMMENT '月次数-剩余',
                                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                 `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                 PRIMARY KEY (`id`),
                                                 UNIQUE KEY `uq_user_id_activity_id_month` (`user_id`,`activity_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表-月次数';

LOCK TABLES `raffle_activity_account_month` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account_month` DISABLE KEYS */;

INSERT INTO `raffle_activity_account_month` (`id`, `user_id`, `activity_id`, `month`, `month_count`, `month_count_surplus`, `create_time`, `update_time`)
VALUES
    (7,'zxy',100301,'2024-05',140,79,'2024-05-01 14:51:45','2024-05-30 08:02:18'),
    (8,'liergou',100301,'2024-05',20,6,'2024-05-04 15:30:36','2024-05-04 15:34:10'),
    (9,'liergou2',100301,'2024-05',100,86,'2024-05-04 15:35:56','2024-05-04 15:37:37'),
    (10,'user003',100301,'2024-05',100,98,'2024-05-25 10:53:19','2024-05-25 10:54:30'),
    (11,'zxy',100301,'2024-06',1188,1161,'2024-06-09 16:39:17','2024-06-22 11:11:02');

/*!40000 ALTER TABLE `raffle_activity_account_month` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_000`;

CREATE TABLE `raffle_activity_order_000` (
                                             `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                             `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                             `sku` bigint(12) NOT NULL COMMENT '商品sku',
                                             `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                             `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                             `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                             `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                             `order_time` datetime NOT NULL COMMENT '下单时间',
                                             `total_count` int(8) NOT NULL COMMENT '总次数',
                                             `day_count` int(8) NOT NULL COMMENT '日次数',
                                             `month_count` int(8) NOT NULL COMMENT '月次数',
                                             `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额【积分】',
                                             `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                             `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             UNIQUE KEY `uq_order_id` (`order_id`),
                                             UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                             KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';



# 转储表 raffle_activity_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_001`;

CREATE TABLE `raffle_activity_order_001` (
                                             `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                             `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                             `sku` bigint(12) NOT NULL COMMENT '商品sku',
                                             `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                             `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                             `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                             `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                             `order_time` datetime NOT NULL COMMENT '下单时间',
                                             `total_count` int(8) NOT NULL COMMENT '总次数',
                                             `day_count` int(8) NOT NULL COMMENT '日次数',
                                             `month_count` int(8) NOT NULL COMMENT '月次数',
                                             `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额【积分】',
                                             `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                             `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             UNIQUE KEY `uq_order_id` (`order_id`),
                                             UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                             KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';

LOCK TABLES `raffle_activity_order_001` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_001` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_001` (`id`, `user_id`, `sku`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `total_count`, `day_count`, `month_count`, `pay_amount`, `state`, `out_business_no`, `create_time`, `update_time`)
VALUES
    (71,'zxy',9011,100301,'测试活动',100006,'761345538871','2024-04-21 10:40:25',1,1,1,0.00,'completed','073735003829','2024-04-21 18:40:25','2024-04-21 18:40:25'),
    (72,'zxy',9011,100301,'测试活动',100006,'837744050164','2024-04-21 10:40:25',1,1,1,0.00,'completed','613036507854','2024-04-21 18:40:25','2024-04-21 18:40:25'),
    (73,'zxy',9011,100301,'测试活动',100006,'766742523760','2024-04-21 10:40:25',1,1,1,0.00,'completed','649099837249','2024-04-21 18:40:25','2024-04-21 18:40:25'),
    (74,'zxy',9011,100301,'测试活动',100006,'856474163547','2024-04-21 10:40:25',1,1,1,0.00,'completed','652903372986','2024-04-21 18:40:25','2024-04-21 18:40:25'),
    (75,'zxy',9011,100301,'测试活动',100006,'668775949799','2024-04-21 10:40:25',1,1,1,0.00,'completed','097066347980','2024-04-21 18:40:25','2024-04-21 18:40:25'),
    (76,'zxy',9011,100301,'测试活动',100006,'164452591012','2024-05-01 06:44:26',10,10,10,0.00,'completed','zxy_sku_2024042903','2024-05-01 14:44:26','2024-05-01 14:44:26'),
    (77,'zxy',9011,100301,'测试活动',100006,'492597085813','2024-05-01 06:51:45',10,10,10,0.00,'completed','zxy_sku_2024042904','2024-05-01 14:51:45','2024-05-01 14:51:45'),
    (78,'zxy',9011,100301,'测试活动',100006,'031706643902','2024-05-01 06:54:36',10,10,10,0.00,'completed','zxy_sku_2024042905','2024-05-01 14:54:36','2024-05-01 14:54:36'),
    (79,'zxy',9011,100301,'测试活动',100006,'460855930969','2024-05-01 07:00:12',10,10,10,0.00,'completed','zxy_sku_2024042906','2024-05-01 15:00:12','2024-05-01 15:00:12'),
    (1096,'zxy',9011,100301,'测试活动',100006,'364757830401','2024-05-01 09:14:43',10,10,10,0.00,'completed','zxy_sku_20240501','2024-05-01 17:14:43','2024-05-01 17:14:43'),
    (1097,'zxy',9011,100301,'测试活动',100006,'157026402583','2024-05-01 09:39:40',10,10,10,0.00,'completed','zxy_sku_20240420','2024-05-01 17:39:40','2024-05-01 17:39:40'),
    (1098,'zxy',9011,100301,'测试活动',100006,'481116019750','2024-05-01 09:41:53',10,10,10,0.00,'completed','zxy_sku_20240401','2024-05-01 17:41:53','2024-05-01 17:41:53'),
    (1099,'zxy',9011,100301,'测试活动',100006,'639151059221','2024-05-01 09:45:10',10,10,10,0.00,'completed','zxy_sku_20240402','2024-05-01 17:45:10','2024-05-01 17:45:10'),
    (4234,'zxy',9011,100301,'测试活动',100006,'129360973197','2024-05-03 05:28:43',10,10,10,0.00,'completed','zxy_sku_20240503','2024-05-03 13:28:42','2024-05-03 13:28:42'),
    (4247,'liergou',9011,100301,'测试活动',100006,'151494600661','2024-05-04 07:32:26',10,10,10,0.00,'completed','liergou_sku_20240504','2024-05-04 15:32:25','2024-05-04 15:32:25'),
    (4248,'zxy',9011,100301,'测试活动',100006,'398083697802','2024-06-08 10:38:59',100,100,100,1.68,'completed','70009240608001','2024-06-08 18:38:59','2024-06-15 10:19:14'),
    (4249,'zxy',9011,100301,'测试活动',100006,'356030049461','2024-06-08 10:54:33',100,100,100,1.68,'completed','70009240608002','2024-06-08 18:54:32','2024-06-15 11:17:24'),
    (4250,'zxy',9011,100301,'测试活动',100006,'605318523315','2024-06-08 10:55:50',100,100,100,1.68,'completed','70009240608003','2024-06-08 18:55:49','2024-06-08 20:29:30'),
    (4251,'zxy',9011,100301,'测试活动',100006,'127654026777','2024-06-08 10:56:28',100,100,100,0.00,'completed','70009240608004','2024-06-08 18:56:27','2024-06-08 18:56:27'),
    (4252,'zxy',9011,100301,'测试活动',100006,'932526349433','2024-06-08 12:33:09',100,100,100,1.68,'completed','70009240608007','2024-06-08 20:33:09','2024-06-08 20:34:13'),
    (4253,'zxy',9011,100301,'测试活动',100006,'073017788455','2024-06-09 01:07:48',100,100,100,1.68,'completed','70009240609001','2024-06-09 09:07:47','2024-06-09 09:11:24'),
    (4254,'zxy',9011,100301,'测试活动',100006,'590031092982','2024-06-09 02:33:49',100,100,100,1.68,'completed','70009240610001','2024-06-09 10:33:48','2024-06-15 11:18:50'),
    (4255,'zxy',9011,100301,'测试活动',100006,'732573213062','2024-06-09 02:43:18',100,100,100,1.68,'completed','70009240610002','2024-06-09 10:43:18','2024-06-09 10:45:11'),
    (4256,'zxy',9011,100301,'测试活动',100006,'046375714484','2024-06-15 03:20:31',100,100,100,1.68,'completed','930967287605','2024-06-15 11:20:31','2024-06-15 11:20:31'),
    (4257,'zxy',9011,100301,'测试活动',100006,'544463875146','2024-06-15 06:46:29',100,100,100,1.68,'completed','737554528904','2024-06-15 14:46:28','2024-06-15 14:46:29'),
    (4258,'zxy',9014,100301,'测试活动',100006,'683837315428','2024-06-22 01:26:03',5,5,5,1.00,'completed','581102699959','2024-06-22 09:26:03','2024-06-22 09:31:17'),
    (4259,'zxy',9014,100301,'测试活动',100006,'175011819792','2024-06-22 01:45:46',5,5,5,1.00,'completed','558549576217','2024-06-22 09:45:46','2024-06-22 09:45:46'),
    (4260,'zxy',9014,100301,'测试活动',100006,'810424954024','2024-06-22 01:45:52',5,5,5,1.00,'completed','512408648536','2024-06-22 09:45:52','2024-06-22 09:45:52'),
    (4261,'zxy',9014,100301,'测试活动',100006,'657692221061','2024-06-22 01:45:54',5,5,5,1.00,'completed','954851009052','2024-06-22 09:45:54','2024-06-22 09:45:54'),
    (4262,'zxy',9014,100301,'测试活动',100006,'447545046420','2024-06-22 01:45:58',5,5,5,1.00,'completed','156304594063','2024-06-22 09:45:58','2024-06-22 09:45:58'),
    (4263,'zxy',9014,100301,'测试活动',100006,'923077693728','2024-06-22 01:49:28',1,1,1,5.00,'completed','844410851560','2024-06-22 09:49:28','2024-06-22 09:49:28'),
    (4264,'zxy',9014,100301,'测试活动',100006,'752103319491','2024-06-22 01:49:32',1,1,1,5.00,'completed','450478498484','2024-06-22 09:49:31','2024-06-22 09:49:31'),
    (4265,'zxy',9014,100301,'测试活动',100006,'749849999347','2024-06-22 03:11:03',1,1,1,5.00,'completed','489789224063','2024-06-22 11:11:02','2024-06-22 11:11:02');

/*!40000 ALTER TABLE `raffle_activity_order_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_002`;

CREATE TABLE `raffle_activity_order_002` (
                                             `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                             `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                             `sku` bigint(12) NOT NULL COMMENT '商品sku',
                                             `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                             `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                             `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                             `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                             `order_time` datetime NOT NULL COMMENT '下单时间',
                                             `total_count` int(8) NOT NULL COMMENT '总次数',
                                             `day_count` int(8) NOT NULL COMMENT '日次数',
                                             `month_count` int(8) NOT NULL COMMENT '月次数',
                                             `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额【积分】',
                                             `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                             `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             UNIQUE KEY `uq_order_id` (`order_id`),
                                             UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                             KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';

LOCK TABLES `raffle_activity_order_002` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_002` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_002` (`id`, `user_id`, `sku`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `total_count`, `day_count`, `month_count`, `pay_amount`, `state`, `out_business_no`, `create_time`, `update_time`)
VALUES
    (1,'liergou2',9011,100301,'测试活动',100006,'987026967898','2024-05-04 07:35:53',100,100,100,0.00,'completed','liergou2_sku_20240504','2024-05-04 15:35:52','2024-05-04 15:35:52'),
    (2,'user003',9011,100301,'测试活动',100006,'700446814309','2024-05-25 02:52:20',100,100,100,0.00,'completed','user003_sku_20240525','2024-05-25 10:52:19','2024-05-25 10:52:19');

/*!40000 ALTER TABLE `raffle_activity_order_002` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_003`;

CREATE TABLE `raffle_activity_order_003` (
                                             `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                             `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                             `sku` bigint(12) NOT NULL COMMENT '商品sku',
                                             `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                             `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                             `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                             `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                             `order_time` datetime NOT NULL COMMENT '下单时间',
                                             `total_count` int(8) NOT NULL COMMENT '总次数',
                                             `day_count` int(8) NOT NULL COMMENT '日次数',
                                             `month_count` int(8) NOT NULL COMMENT '月次数',
                                             `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额【积分】',
                                             `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                             `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             UNIQUE KEY `uq_order_id` (`order_id`),
                                             UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                             KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';

LOCK TABLES `raffle_activity_order_003` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_003` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_003` (`id`, `user_id`, `sku`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `total_count`, `day_count`, `month_count`, `pay_amount`, `state`, `out_business_no`, `create_time`, `update_time`)
VALUES
    (1,'zxy26',9014,100301,'测试活动',100006,'197003210793','2024-06-22 02:22:35',1,1,1,0.00,'completed','zxy26_sku_20240622','2024-06-22 10:22:35','2024-06-22 10:22:35');

/*!40000 ALTER TABLE `raffle_activity_order_003` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
                        `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                        `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                        `topic` varchar(32) NOT NULL COMMENT '消息主题',
                        `message_id` varchar(11) DEFAULT NULL COMMENT '消息编号',
                        `message` varchar(512) NOT NULL COMMENT '消息主体',
                        `state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '任务状态；create-创建、completed-完成、fail-失败',
                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `uq_message_id` (`message_id`),
                        KEY `idx_state` (`state`),
                        KEY `idx_create_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务表，发送MQ';

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;

INSERT INTO `task` (`id`, `user_id`, `topic`, `message_id`, `message`, `state`, `create_time`, `update_time`)
VALUES
    (1,'zxy','send_award','23913710462','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"23913710462\",\"timestamp\":1712374909975}','completed','2024-04-06 11:41:50','2024-04-06 12:14:50'),
    (2,'zxy','send_award','33004806135','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"33004806135\",\"timestamp\":1712375273609}','completed','2024-04-06 11:47:54','2024-04-06 12:14:50'),
    (3,'zxy','send_award','61315401992','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"61315401992\",\"timestamp\":1712377009778}','completed','2024-04-06 12:16:50','2024-04-06 12:16:50'),
    (4,'zxy','send_award','74920280321','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"74920280321\",\"timestamp\":1712377010878}','completed','2024-04-06 12:16:50','2024-04-06 12:16:50'),
    (5,'zxy','send_award','71692388884','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"71692388884\",\"timestamp\":1712377011390}','completed','2024-04-06 12:16:51','2024-04-06 12:16:51'),
    (6,'zxy','send_award','11524874230','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"11524874230\",\"timestamp\":1712377011913}','completed','2024-04-06 12:16:51','2024-04-06 12:16:51'),
    (7,'zxy','send_award','39972412889','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"39972412889\",\"timestamp\":1712377012434}','completed','2024-04-06 12:16:52','2024-04-06 12:16:52'),
    (8,'zxy','send_award','79019640497','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"79019640497\",\"timestamp\":1712377012955}','completed','2024-04-06 12:16:52','2024-04-06 12:16:52'),
    (9,'zxy','send_award','97077031398','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"97077031398\",\"timestamp\":1712377013498}','completed','2024-04-06 12:16:53','2024-04-06 12:16:53'),
    (10,'zxy','send_award','08720582836','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"08720582836\",\"timestamp\":1712377014017}','completed','2024-04-06 12:16:54','2024-04-06 12:16:54'),
    (11,'zxy','send_award','60787815183','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"60787815183\",\"timestamp\":1712377014529}','completed','2024-04-06 12:16:54','2024-04-06 12:16:54'),
    (12,'zxy','send_award','97145040946','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"97145040946\",\"timestamp\":1712377015040}','completed','2024-04-06 12:16:55','2024-04-06 12:16:55'),
    (13,'zxy','send_award','40165031868','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"40165031868\",\"timestamp\":1712377015553}','completed','2024-04-06 12:16:55','2024-04-06 12:16:55'),
    (14,'zxy','send_award','31142176572','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"31142176572\",\"timestamp\":1712377016066}','completed','2024-04-06 12:16:56','2024-04-06 12:16:56'),
    (15,'zxy','send_award','54723488249','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"54723488249\",\"timestamp\":1712377016577}','completed','2024-04-06 12:16:56','2024-04-06 12:16:56'),
    (16,'zxy','send_award','94553316274','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"94553316274\",\"timestamp\":1712377017090}','completed','2024-04-06 12:16:57','2024-04-06 16:07:00'),
    (17,'zxy','send_award','47638237311','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"47638237311\",\"timestamp\":1712377017601}','completed','2024-04-06 12:16:57','2024-04-06 16:07:00'),
    (18,'zxy','send_award','08472548108','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"08472548108\",\"timestamp\":1712377018112}','completed','2024-04-06 12:16:58','2024-04-06 16:07:00'),
    (19,'zxy','send_award','01704262897','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"01704262897\",\"timestamp\":1712391038041}','completed','2024-04-06 16:10:38','2024-04-06 16:10:38'),
    (20,'zxy','send_award','96818112357','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"96818112357\",\"timestamp\":1712391039234}','completed','2024-04-06 16:10:39','2024-04-06 16:10:39'),
    (21,'zxy','send_award','39815817631','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"39815817631\",\"timestamp\":1712391039751}','completed','2024-04-06 16:10:39','2024-04-06 16:10:39'),
    (22,'zxy','send_award','44228382875','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"44228382875\",\"timestamp\":1712391040268}','completed','2024-04-06 16:10:40','2024-04-06 16:10:40'),
    (23,'zxy','send_award','61240314870','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"61240314870\",\"timestamp\":1712391040784}','completed','2024-04-06 16:10:40','2024-04-06 16:10:40'),
    (24,'zxy','send_award','30911821347','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"30911821347\",\"timestamp\":1712391041333}','completed','2024-04-06 16:10:41','2024-04-06 16:10:41'),
    (25,'zxy','send_award','41575602711','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"41575602711\",\"timestamp\":1712391041849}','completed','2024-04-06 16:10:41','2024-04-06 16:10:41'),
    (26,'zxy','send_award','72379603310','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"72379603310\",\"timestamp\":1712391042361}','completed','2024-04-06 16:10:42','2024-04-06 16:10:42'),
    (27,'zxy','send_award','51671684313','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"51671684313\",\"timestamp\":1712391042875}','completed','2024-04-06 16:10:42','2024-04-06 16:10:42'),
    (28,'zxy','send_award','11840468669','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"11840468669\",\"timestamp\":1712391043390}','completed','2024-04-06 16:10:43','2024-04-06 16:10:43'),
    (29,'zxy','send_award','18467905170','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"18467905170\",\"timestamp\":1712391043908}','completed','2024-04-06 16:10:43','2024-04-06 16:10:43'),
    (30,'zxy','send_award','33233781451','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"33233781451\",\"timestamp\":1712391044424}','completed','2024-04-06 16:10:44','2024-04-06 16:10:44'),
    (31,'zxy','send_award','09679212052','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"09679212052\",\"timestamp\":1712391044938}','completed','2024-04-06 16:10:44','2024-04-06 16:10:44'),
    (32,'zxy','send_award','96862889309','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"96862889309\",\"timestamp\":1712391045450}','completed','2024-04-06 16:10:45','2024-04-06 16:10:45'),
    (33,'zxy','send_award','69912628282','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"69912628282\",\"timestamp\":1712391045962}','completed','2024-04-06 16:10:45','2024-04-06 16:10:45'),
    (34,'zxy','send_award','26021447219','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"26021447219\",\"timestamp\":1712391046477}','completed','2024-04-06 16:10:46','2024-04-13 10:48:45'),
    (35,'zxy','send_award','29510804265','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"zxy\"},\"id\":\"29510804265\",\"timestamp\":1712391047005}','completed','2024-04-06 16:10:47','2024-04-13 10:48:45'),
    (36,'zxy','send_award','99669876677','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"zxy\"},\"id\":\"99669876677\",\"timestamp\":1712979841591}','completed','2024-04-13 11:44:01','2024-04-13 11:44:01'),
    (37,'zxy','send_award','13183725005','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"zxy\"},\"id\":\"13183725005\",\"timestamp\":1712979850853}','completed','2024-04-13 11:44:10','2024-04-13 11:44:10'),
    (38,'zxy','send_award','13436201468','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"zxy\"},\"id\":\"13436201468\",\"timestamp\":1712979854073}','completed','2024-04-13 11:44:14','2024-04-13 11:44:14'),
    (39,'zxy','send_award','89567645271','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"zxy\"},\"id\":\"89567645271\",\"timestamp\":1712979855601}','completed','2024-04-13 11:44:15','2024-04-13 11:44:15'),
    (40,'zxy','send_award','00308200403','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"zxy\"},\"id\":\"00308200403\",\"timestamp\":1712979856602}','completed','2024-04-13 11:44:16','2024-04-13 11:44:16'),
    (41,'zxy','send_award','70460061560','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"zxy\"},\"id\":\"70460061560\",\"timestamp\":1712979857586}','completed','2024-04-13 11:44:17','2024-04-13 11:44:17'),
    (42,'zxy','send_award','03493035635','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"zxy\"},\"id\":\"03493035635\",\"timestamp\":1712979858714}','completed','2024-04-13 11:44:18','2024-04-13 11:44:18'),
    (43,'zxy','send_award','22062172114','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"zxy\"},\"id\":\"22062172114\",\"timestamp\":1712979929672}','completed','2024-04-13 11:45:29','2024-04-13 11:45:29'),
    (44,'zxy','send_award','75973092346','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"zxy\"},\"id\":\"75973092346\",\"timestamp\":1712979930723}','completed','2024-04-13 11:45:30','2024-04-13 11:45:30'),
    (45,'zxy','send_award','32769685487','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"zxy\"},\"id\":\"32769685487\",\"timestamp\":1712981693149}','completed','2024-04-13 12:14:53','2024-04-13 12:14:53'),
    (46,'zxy','send_award','85144595338','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"zxy\"},\"id\":\"85144595338\",\"timestamp\":1712981853669}','completed','2024-04-13 12:17:33','2024-04-13 12:17:33'),
    (47,'zxy','send_award','44874364790','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"zxy\"},\"id\":\"44874364790\",\"timestamp\":1712981896942}','completed','2024-04-13 12:18:16','2024-04-13 12:18:16'),
    (48,'zxy','send_award','85399883630','{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"zxy\"},\"id\":\"85399883630\",\"timestamp\":1712981903339}','completed','2024-04-13 12:18:23','2024-04-13 12:18:23'),
    (49,'zxy','send_award','29729581514','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"zxy\"},\"id\":\"29729581514\",\"timestamp\":1712981904841}','completed','2024-04-13 12:18:24','2024-04-13 12:18:24'),
    (50,'zxy','send_award','74718298956','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"zxy\"},\"id\":\"74718298956\",\"timestamp\":1712981905797}','completed','2024-04-13 12:18:25','2024-04-13 12:18:25'),
    (51,'zxy','send_award','50114477022','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"zxy\"},\"id\":\"50114477022\",\"timestamp\":1712981916880}','completed','2024-04-13 12:18:36','2024-04-13 12:18:36'),
    (52,'zxy','send_award','28956245329','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"zxy\"},\"id\":\"28956245329\",\"timestamp\":1712982007542}','completed','2024-04-13 12:20:07','2024-04-13 12:20:07'),
    (53,'zxy','send_award','99592907656','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"zxy\"},\"id\":\"99592907656\",\"timestamp\":1712982009729}','completed','2024-04-13 12:20:09','2024-04-13 12:20:09'),
    (54,'zxy','send_award','19525539782','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"zxy\"},\"id\":\"19525539782\",\"timestamp\":1712982013711}','completed','2024-04-13 12:20:13','2024-04-13 12:20:13'),
    (55,'zxy','send_award','47878047199','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"zxy\"},\"id\":\"47878047199\",\"timestamp\":1712982014913}','completed','2024-04-13 12:20:14','2024-04-13 12:20:14'),
    (56,'zxy','send_award','27264311844','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"zxy\"},\"id\":\"27264311844\",\"timestamp\":1712982016134}','completed','2024-04-13 12:20:16','2024-04-13 12:20:16'),
    (57,'zxy','send_award','77749836320','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"zxy\"},\"id\":\"77749836320\",\"timestamp\":1712982020673}','completed','2024-04-13 12:20:20','2024-04-13 12:20:20'),
    (58,'zxy','send_award','47587820823','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"zxy\"},\"id\":\"47587820823\",\"timestamp\":1712988239372}','completed','2024-04-13 14:03:59','2024-04-13 14:03:59'),
    (59,'zxy','send_award','58931754976','{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"zxy\"},\"id\":\"58931754976\",\"timestamp\":1712993105696}','completed','2024-04-13 15:25:06','2024-04-13 15:25:06'),
    (60,'zxy','send_award','67608143436','{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"zxy\"},\"id\":\"67608143436\",\"timestamp\":1712993111209}','completed','2024-04-13 15:25:11','2024-04-13 15:25:11'),
    (61,'zxy','send_award','22711974997','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"zxy\"},\"id\":\"22711974997\",\"timestamp\":1712993112288}','completed','2024-04-13 15:25:12','2024-04-13 15:25:12'),
    (62,'zxy','send_award','39728508373','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"zxy\"},\"id\":\"39728508373\",\"timestamp\":1712993121051}','completed','2024-04-13 15:25:21','2024-04-13 15:25:21'),
    (63,'zxy','send_award','29346013696','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"zxy\"},\"id\":\"29346013696\",\"timestamp\":1713586170567}','completed','2024-04-20 12:09:30','2024-04-20 12:09:30'),
    (64,'zxy','send_award','26345538109','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"zxy\"},\"id\":\"26345538109\",\"timestamp\":1713586284216}','completed','2024-04-20 12:11:24','2024-04-20 12:11:24'),
    (65,'zxy','send_award','08631161692','{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"zxy\"},\"id\":\"08631161692\",\"timestamp\":1713597058001}','completed','2024-04-20 15:10:58','2024-04-20 15:10:58'),
    (66,'zxy','send_award','39622786502','{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"zxy\"},\"id\":\"39622786502\",\"timestamp\":1713598992837}','completed','2024-04-20 15:43:13','2024-04-20 15:43:13'),
    (67,'zxy','send_award','66657753896','{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"zxy\"},\"id\":\"66657753896\",\"timestamp\":1713603038553}','completed','2024-04-20 16:50:39','2024-04-20 16:50:39'),
    (68,'zxy','send_award','87700384224','{\"data\":{\"awardId\":108,\"awardTitle\":\"温馨玩偶\",\"userId\":\"zxy\"},\"id\":\"87700384224\",\"timestamp\":1714195178827}','completed','2024-04-27 13:19:38','2024-04-27 13:19:38'),
    (69,'zxy','send_award','34246976218','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"zxy\"},\"id\":\"34246976218\",\"timestamp\":1714195637200}','completed','2024-04-27 13:27:17','2024-04-27 13:27:17'),
    (70,'zxy','send_award','67418825974','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"userId\":\"zxy\"},\"id\":\"67418825974\",\"timestamp\":1714195665080}','completed','2024-04-27 13:27:45','2024-04-27 13:27:45'),
    (71,'zxy','send_award','28182567445','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"28182567445\",\"timestamp\":1714195681839}','completed','2024-04-27 13:28:01','2024-04-27 13:28:01'),
    (72,'zxy','send_award','43921644960','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"zxy\"},\"id\":\"43921644960\",\"timestamp\":1714195745254}','completed','2024-04-27 13:29:05','2024-04-27 13:29:05'),
    (73,'zxy','send_award','83192193690','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"zxy\"},\"id\":\"83192193690\",\"timestamp\":1714195771714}','completed','2024-04-27 13:29:31','2024-04-27 13:29:31'),
    (74,'zxy','send_award','71879339129','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"zxy\"},\"id\":\"71879339129\",\"timestamp\":1714195797449}','completed','2024-04-27 13:29:57','2024-04-27 13:29:57'),
    (75,'zxy','send_award','82583508840','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"userId\":\"zxy\"},\"id\":\"82583508840\",\"timestamp\":1714195811069}','completed','2024-04-27 13:30:11','2024-04-27 13:30:11'),
    (76,'zxy','send_award','21336975617','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"userId\":\"zxy\"},\"id\":\"21336975617\",\"timestamp\":1714196187285}','completed','2024-04-27 13:36:27','2024-04-27 13:36:27'),
    (77,'zxy','send_award','54277155930','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"zxy\"},\"id\":\"54277155930\",\"timestamp\":1714196280178}','completed','2024-04-27 13:38:00','2024-04-27 13:38:00'),
    (78,'zxy','send_award','90789466751','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"userId\":\"zxy\"},\"id\":\"90789466751\",\"timestamp\":1714196335804}','completed','2024-04-27 13:38:55','2024-04-27 13:38:55'),
    (79,'zxy','send_award','62146713103','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"zxy\"},\"id\":\"62146713103\",\"timestamp\":1714196358336}','completed','2024-04-27 13:39:18','2024-04-27 13:39:18'),
    (80,'zxy','send_award','69804673669','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"zxy\"},\"id\":\"69804673669\",\"timestamp\":1714201196264}','completed','2024-04-27 14:59:56','2024-04-27 14:59:56'),
    (81,'zxy','send_award','56789986275','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"56789986275\",\"timestamp\":1714201214179}','completed','2024-04-27 15:00:14','2024-04-27 15:00:14'),
    (82,'zxy','send_award','05612212348','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"userId\":\"zxy\"},\"id\":\"05612212348\",\"timestamp\":1714201222825}','completed','2024-04-27 15:00:22','2024-04-27 15:00:22'),
    (83,'zxy','send_rebate','35170430024','{\"data\":{\"bizId\":\"zxy_sku_20240430\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"35170430024\",\"timestamp\":1714471292871}','completed','2024-04-30 18:01:33','2024-04-30 18:01:33'),
    (84,'zxy','send_rebate','33541289034','{\"data\":{\"bizId\":\"zxy_sku_20240430\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"33541289034\",\"timestamp\":1714471544134}','completed','2024-04-30 18:05:44','2024-04-30 18:05:44'),
    (85,'zxy','send_rebate','42019106000','{\"data\":{\"bizId\":\"zxy_integral_20240430\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"42019106000\",\"timestamp\":1714471544137}','completed','2024-04-30 18:05:44','2024-04-30 18:05:44'),
    (86,'zxy','send_rebate','19381004535','{\"data\":{\"bizId\":\"zxy_sku_20240429\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"19381004535\",\"timestamp\":1714472470563}','completed','2024-04-30 18:21:10','2024-04-30 18:21:10'),
    (87,'zxy','send_rebate','64076325441','{\"data\":{\"bizId\":\"zxy_integral_20240429\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"64076325441\",\"timestamp\":1714472470567}','completed','2024-04-30 18:21:10','2024-04-30 18:21:10'),
    (88,'zxy','send_rebate','68231201640','{\"data\":{\"bizId\":\"zxy_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"68231201640\",\"timestamp\":1714528145559}','completed','2024-05-01 09:49:06','2024-05-01 09:50:45'),
    (89,'zxy','send_rebate','50111005352','{\"data\":{\"bizId\":\"zxy_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"50111005352\",\"timestamp\":1714528145563}','completed','2024-05-01 09:49:06','2024-05-01 09:50:45'),
    (90,'zxy','send_rebate','75682316589','{\"data\":{\"bizId\":\"zxy_sku_20240502\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"75682316589\",\"timestamp\":1714528244315}','completed','2024-05-01 09:50:44','2024-05-01 09:50:44'),
    (91,'zxy','send_rebate','15910602537','{\"data\":{\"bizId\":\"zxy_integral_20240502\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"15910602537\",\"timestamp\":1714528244322}','completed','2024-05-01 09:50:44','2024-05-01 09:50:44'),
    (92,'zxy','send_rebate','84186056749','{\"data\":{\"bizId\":\"zxy_sku_2024042901\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"84186056749\",\"timestamp\":1714543316732}','completed','2024-05-01 14:01:57','2024-05-01 14:01:57'),
    (93,'zxy','send_rebate','96465813570','{\"data\":{\"bizId\":\"zxy_integral_2024042901\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"96465813570\",\"timestamp\":1714543316735}','completed','2024-05-01 14:01:57','2024-05-01 14:01:57'),
    (94,'zxy','send_rebate','52282173291','{\"data\":{\"bizId\":\"zxy_sku_2024042902\",\"rebateConfig\":\"9011\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"52282173291\",\"timestamp\":1714545280296}','completed','2024-05-01 14:34:40','2024-05-01 14:34:40'),
    (95,'zxy','send_rebate','57252028754','{\"data\":{\"bizId\":\"zxy_integral_2024042902\",\"rebateConfig\":\"10\",\"rebateType\":\"sign\",\"userId\":\"zxy\"},\"id\":\"57252028754\",\"timestamp\":1714545280298}','completed','2024-05-01 14:34:40','2024-05-01 14:34:40'),
    (96,'zxy','send_rebate','49677315112','{\"data\":{\"bizId\":\"zxy_sku_2024042903\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"49677315112\",\"timestamp\":1714545434013}','completed','2024-05-01 14:37:14','2024-05-01 14:37:14'),
    (97,'zxy','send_rebate','29687183027','{\"data\":{\"bizId\":\"zxy_integral_2024042903\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"29687183027\",\"timestamp\":1714545434017}','completed','2024-05-01 14:37:14','2024-05-01 14:37:14'),
    (98,'zxy','send_rebate','55494780983','{\"data\":{\"bizId\":\"zxy_sku_2024042904\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"55494780983\",\"timestamp\":1714546304733}','completed','2024-05-01 14:51:45','2024-05-01 14:51:45'),
    (99,'zxy','send_rebate','63676464061','{\"data\":{\"bizId\":\"zxy_integral_2024042904\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"63676464061\",\"timestamp\":1714546304736}','completed','2024-05-01 14:51:45','2024-05-01 14:51:45'),
    (100,'zxy','send_rebate','97069945042','{\"data\":{\"bizId\":\"zxy_sku_2024042905\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"97069945042\",\"timestamp\":1714546475883}','completed','2024-05-01 14:54:36','2024-05-01 14:54:36'),
    (101,'zxy','send_rebate','25711583274','{\"data\":{\"bizId\":\"zxy_integral_2024042905\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"25711583274\",\"timestamp\":1714546475885}','completed','2024-05-01 14:54:36','2024-05-01 14:54:36'),
    (102,'zxy','send_award','42156280709','{\"data\":{\"awardId\":108,\"awardTitle\":\"温馨玩偶\",\"userId\":\"zxy\"},\"id\":\"42156280709\",\"timestamp\":1714546659050}','completed','2024-05-01 14:57:39','2024-05-01 14:57:39'),
    (103,'zxy','send_award','78085050648','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"zxy\"},\"id\":\"78085050648\",\"timestamp\":1714546688551}','completed','2024-05-01 14:58:08','2024-05-01 14:58:08'),
    (104,'zxy','send_award','55842869580','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"userId\":\"zxy\"},\"id\":\"55842869580\",\"timestamp\":1714546773027}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (105,'zxy','send_award','86587566543','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"zxy\"},\"id\":\"86587566543\",\"timestamp\":1714546773422}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (106,'zxy','send_award','88267642020','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"zxy\"},\"id\":\"88267642020\",\"timestamp\":1714546773490}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (107,'zxy','send_award','03348496593','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"zxy\"},\"id\":\"03348496593\",\"timestamp\":1714546773570}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (108,'zxy','send_award','20140993483','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"userId\":\"zxy\"},\"id\":\"20140993483\",\"timestamp\":1714546773661}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (109,'zxy','send_award','95682596295','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"userId\":\"zxy\"},\"id\":\"95682596295\",\"timestamp\":1714546773713}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (110,'zxy','send_award','95939034377','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"userId\":\"zxy\"},\"id\":\"95939034377\",\"timestamp\":1714546773772}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (111,'zxy','send_award','28569395651','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"zxy\"},\"id\":\"28569395651\",\"timestamp\":1714546773829}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (112,'zxy','send_award','37713199996','{\"data\":{\"awardId\":108,\"awardTitle\":\"温馨玩偶\",\"userId\":\"zxy\"},\"id\":\"37713199996\",\"timestamp\":1714546773889}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (113,'zxy','send_award','39729736863','{\"data\":{\"awardId\":108,\"awardTitle\":\"温馨玩偶\",\"userId\":\"zxy\"},\"id\":\"39729736863\",\"timestamp\":1714546773937}','completed','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (114,'zxy','send_award','63571397739','{\"data\":{\"awardId\":108,\"awardTitle\":\"温馨玩偶\",\"userId\":\"zxy\"},\"id\":\"63571397739\",\"timestamp\":1714546774008}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (115,'zxy','send_award','41779666583','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"userId\":\"zxy\"},\"id\":\"41779666583\",\"timestamp\":1714546774083}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (116,'zxy','send_award','35122333142','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"userId\":\"zxy\"},\"id\":\"35122333142\",\"timestamp\":1714546774144}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (117,'zxy','send_award','07007092150','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"07007092150\",\"timestamp\":1714546774211}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (118,'zxy','send_award','08460963032','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"zxy\"},\"id\":\"08460963032\",\"timestamp\":1714546774278}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (119,'zxy','send_award','06210115971','{\"data\":{\"awardId\":108,\"awardTitle\":\"温馨玩偶\",\"userId\":\"zxy\"},\"id\":\"06210115971\",\"timestamp\":1714546774344}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (120,'zxy','send_award','78110342017','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"userId\":\"zxy\"},\"id\":\"78110342017\",\"timestamp\":1714546774404}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (121,'zxy','send_award','34349719655','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"zxy\"},\"id\":\"34349719655\",\"timestamp\":1714546774481}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (122,'zxy','send_award','16795012327','{\"data\":{\"awardId\":108,\"awardTitle\":\"温馨玩偶\",\"userId\":\"zxy\"},\"id\":\"16795012327\",\"timestamp\":1714546774537}','completed','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (123,'zxy','send_rebate','01343683507','{\"data\":{\"bizId\":\"zxy_sku_2024042906\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"01343683507\",\"timestamp\":1714546811980}','completed','2024-05-01 15:00:12','2024-05-01 15:00:12'),
    (124,'zxy','send_rebate','22675851113','{\"data\":{\"bizId\":\"zxy_integral_2024042906\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"22675851113\",\"timestamp\":1714546811983}','completed','2024-05-01 15:00:12','2024-05-01 15:00:12'),
    (125,'zxy','send_rebate','72790041499','{\"data\":{\"bizId\":\"zxy_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"72790041499\",\"timestamp\":1714547646310}','completed','2024-05-01 15:14:06','2024-05-01 15:14:06'),
    (126,'zxy','send_rebate','07532513295','{\"data\":{\"bizId\":\"zxy_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"07532513295\",\"timestamp\":1714547646312}','completed','2024-05-01 15:14:06','2024-05-01 15:14:06'),
    (127,'12345','send_rebate','44168301206','{\"data\":{\"bizId\":\"12345_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"12345\"},\"id\":\"44168301206\",\"timestamp\":1714548524834}','completed','2024-05-01 15:28:45','2024-05-01 15:28:45'),
    (128,'12345','send_rebate','77696087444','{\"data\":{\"bizId\":\"12345_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"12345\"},\"id\":\"77696087444\",\"timestamp\":1714548524845}','completed','2024-05-01 15:28:45','2024-05-01 15:28:45'),
    (129,'zxy','send_rebate','53358221321','{\"data\":{\"bizId\":\"zxy_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"53358221321\",\"timestamp\":1714554815882}','completed','2024-05-01 17:13:36','2024-05-01 17:13:36'),
    (130,'zxy','send_rebate','29895043546','{\"data\":{\"bizId\":\"zxy_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"29895043546\",\"timestamp\":1714554815884}','completed','2024-05-01 17:13:36','2024-05-01 17:13:36'),
    (131,'zxy','send_rebate','97779206565','{\"data\":{\"bizId\":\"zxy_sku_20240420\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"97779206565\",\"timestamp\":1714556371985}','completed','2024-05-01 17:39:32','2024-05-01 17:39:35'),
    (132,'zxy','send_rebate','63122692373','{\"data\":{\"bizId\":\"zxy_integral_20240420\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"63122692373\",\"timestamp\":1714556371994}','completed','2024-05-01 17:39:32','2024-05-01 17:39:35'),
    (133,'zxy','send_rebate','64655129366','{\"data\":{\"bizId\":\"zxy_sku_20240401\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"64655129366\",\"timestamp\":1714556504378}','completed','2024-05-01 17:41:45','2024-05-01 17:41:45'),
    (134,'zxy','send_rebate','38396244073','{\"data\":{\"bizId\":\"zxy_integral_20240401\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"38396244073\",\"timestamp\":1714556504389}','completed','2024-05-01 17:41:45','2024-05-01 17:41:45'),
    (135,'zxy','send_rebate','08184105296','{\"data\":{\"bizId\":\"zxy_sku_20240402\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"08184105296\",\"timestamp\":1714556709389}','completed','2024-05-01 17:45:09','2024-05-01 17:45:09'),
    (136,'zxy','send_rebate','16417473546','{\"data\":{\"bizId\":\"zxy_integral_20240402\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"16417473546\",\"timestamp\":1714556709391}','completed','2024-05-01 17:45:09','2024-05-01 17:45:09'),
    (137,'zxy','send_rebate','04164162705','{\"data\":{\"bizId\":\"zxy_sku_20240501\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"04164162705\",\"timestamp\":1714557266867}','completed','2024-05-01 17:54:27','2024-05-01 17:54:27'),
    (138,'zxy','send_rebate','79924892493','{\"data\":{\"bizId\":\"zxy_integral_20240501\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"79924892493\",\"timestamp\":1714557266870}','completed','2024-05-01 17:54:27','2024-05-01 17:54:27'),
    (139,'zxy','send_award','90576859616','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"userId\":\"zxy\"},\"id\":\"90576859616\",\"timestamp\":1714698137578}','completed','2024-05-03 09:02:17','2024-05-03 09:02:17'),
    (140,'zxy','send_award','65620335186','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"zxy\"},\"id\":\"65620335186\",\"timestamp\":1714698596791}','completed','2024-05-03 09:09:57','2024-05-03 09:09:57'),
    (141,'zxy','send_award','37556739286','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"37556739286\",\"timestamp\":1714698634894}','completed','2024-05-03 09:10:35','2024-05-03 09:10:35'),
    (142,'zxy','send_award','55348135802','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"55348135802\",\"timestamp\":1714698697948}','completed','2024-05-03 09:11:38','2024-05-03 09:11:38'),
    (143,'zxy','send_rebate','72638302928','{\"data\":{\"bizId\":\"zxy_sku_20240503\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"72638302928\",\"timestamp\":1714714122098}','completed','2024-05-03 13:28:42','2024-05-03 13:28:42'),
    (144,'zxy','send_rebate','72714070579','{\"data\":{\"bizId\":\"zxy_integral_20240503\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"72714070579\",\"timestamp\":1714714122101}','completed','2024-05-03 13:28:42','2024-05-03 13:28:42'),
    (145,'zxy','send_award','16274942215','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"userId\":\"zxy\"},\"id\":\"16274942215\",\"timestamp\":1714786330913}','completed','2024-05-04 09:32:10','2024-05-04 09:32:10'),
    (146,'zxy','send_award','11783185223','{\"data\":{\"awardId\":105,\"awardTitle\":\"PS5\",\"userId\":\"zxy\"},\"id\":\"11783185223\",\"timestamp\":1714786931187}','completed','2024-05-04 09:42:11','2024-05-04 09:42:11'),
    (147,'zxy','send_award','34265015511','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"34265015511\",\"timestamp\":1714788400164}','completed','2024-05-04 10:06:40','2024-05-04 10:06:40'),
    (148,'zxy','send_award','11011728809','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"11011728809\",\"timestamp\":1714788456611}','completed','2024-05-04 10:07:36','2024-05-04 10:07:36'),
    (149,'zxy','send_award','53652403098','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"53652403098\",\"timestamp\":1714788464629}','completed','2024-05-04 10:07:44','2024-05-04 10:07:44'),
    (150,'zxy','send_award','51640617337','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"51640617337\",\"timestamp\":1714788921450}','completed','2024-05-04 10:15:21','2024-05-04 10:15:21'),
    (151,'zxy','send_award','32259543619','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"32259543619\",\"timestamp\":1714788929172}','completed','2024-05-04 10:15:29','2024-05-04 10:15:29'),
    (152,'zxy','send_award','00793022201','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"00793022201\",\"timestamp\":1714789011304}','completed','2024-05-04 10:16:51','2024-05-04 10:16:51'),
    (153,'zxy','send_award','99216566028','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"99216566028\",\"timestamp\":1714789039582}','completed','2024-05-04 10:17:19','2024-05-04 10:17:19'),
    (154,'zxy','send_award','04877391204','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"04877391204\",\"timestamp\":1714789089075}','completed','2024-05-04 10:18:09','2024-05-04 10:18:09'),
    (155,'zxy','send_award','91534655048','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"91534655048\",\"timestamp\":1714789246122}','completed','2024-05-04 10:20:46','2024-05-04 10:20:46'),
    (156,'zxy','send_award','60332832674','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"60332832674\",\"timestamp\":1714789254207}','completed','2024-05-04 10:20:54','2024-05-04 10:20:54'),
    (157,'zxy','send_award','40483872758','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"40483872758\",\"timestamp\":1714790192823}','completed','2024-05-04 10:36:32','2024-05-04 10:36:32'),
    (158,'zxy','send_award','11486109864','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"11486109864\",\"timestamp\":1714790245060}','completed','2024-05-04 10:37:25','2024-05-04 10:37:25'),
    (159,'zxy','send_award','76753189160','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"76753189160\",\"timestamp\":1714790252173}','completed','2024-05-04 10:37:32','2024-05-04 10:37:32'),
    (160,'zxy','send_award','58351463446','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"58351463446\",\"timestamp\":1714790259659}','completed','2024-05-04 10:37:39','2024-05-04 10:37:39'),
    (161,'zxy','send_award','23537323373','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"23537323373\",\"timestamp\":1714790321485}','completed','2024-05-04 10:38:41','2024-05-04 10:38:41'),
    (162,'zxy','send_award','94019822881','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"94019822881\",\"timestamp\":1714790329428}','completed','2024-05-04 10:38:49','2024-05-04 10:38:49'),
    (163,'zxy','send_rebate','27195595790','{\"data\":{\"bizId\":\"zxy_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"27195595790\",\"timestamp\":1714791759648}','completed','2024-05-04 11:02:39','2024-05-04 11:02:39'),
    (164,'zxy','send_rebate','61629814089','{\"data\":{\"bizId\":\"zxy_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"61629814089\",\"timestamp\":1714791759660}','completed','2024-05-04 11:02:39','2024-05-04 11:02:39'),
    (165,'zxy','send_rebate','11862182444','{\"data\":{\"bizId\":\"zxy_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"11862182444\",\"timestamp\":1714792313049}','completed','2024-05-04 11:11:53','2024-05-04 11:11:53'),
    (166,'zxy','send_rebate','15679450368','{\"data\":{\"bizId\":\"zxy_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"15679450368\",\"timestamp\":1714792313050}','completed','2024-05-04 11:11:53','2024-05-04 11:11:53'),
    (167,'zxy','send_rebate','43063729637','{\"data\":{\"bizId\":\"zxy_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"43063729637\",\"timestamp\":1714792339076}','completed','2024-05-04 11:12:19','2024-05-04 11:12:19'),
    (168,'zxy','send_rebate','98996977753','{\"data\":{\"bizId\":\"zxy_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"98996977753\",\"timestamp\":1714792339076}','completed','2024-05-04 11:12:19','2024-05-04 11:12:19'),
    (169,'zxy','send_rebate','27475864066','{\"data\":{\"bizId\":\"zxy_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"27475864066\",\"timestamp\":1714792521633}','completed','2024-05-04 11:15:21','2024-05-04 11:15:21'),
    (170,'zxy','send_rebate','92639713795','{\"data\":{\"bizId\":\"zxy_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"92639713795\",\"timestamp\":1714792521636}','completed','2024-05-04 11:15:21','2024-05-04 11:15:21'),
    (171,'zxy','send_rebate','99203819313','{\"data\":{\"bizId\":\"zxy_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"99203819313\",\"timestamp\":1714792620935}','completed','2024-05-04 11:17:00','2024-05-04 11:17:01'),
    (172,'zxy','send_rebate','74660956883','{\"data\":{\"bizId\":\"zxy_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"74660956883\",\"timestamp\":1714792620937}','completed','2024-05-04 11:17:00','2024-05-04 11:17:01'),
    (173,'zxy','send_rebate','25704016034','{\"data\":{\"bizId\":\"zxy_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"25704016034\",\"timestamp\":1714793089441}','completed','2024-05-04 11:24:49','2024-05-04 11:24:49'),
    (174,'zxy','send_rebate','22457985518','{\"data\":{\"bizId\":\"zxy_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"22457985518\",\"timestamp\":1714793089453}','completed','2024-05-04 11:24:49','2024-05-04 11:24:49'),
    (175,'zxy','send_award','47589004216','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"47589004216\",\"timestamp\":1714793447481}','completed','2024-05-04 11:30:47','2024-05-04 11:30:47'),
    (176,'zxy','send_rebate','42725365297','{\"data\":{\"bizId\":\"zxy_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"42725365297\",\"timestamp\":1714793669228}','completed','2024-05-04 11:34:29','2024-05-04 11:34:29'),
    (177,'zxy','send_rebate','87435787450','{\"data\":{\"bizId\":\"zxy_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"87435787450\",\"timestamp\":1714793669228}','completed','2024-05-04 11:34:29','2024-05-04 11:34:29'),
    (178,'zxy','send_rebate','49417412468','{\"data\":{\"bizId\":\"zxy_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"49417412468\",\"timestamp\":1714793834886}','completed','2024-05-04 11:37:14','2024-05-04 11:37:14'),
    (179,'zxy','send_rebate','62113651314','{\"data\":{\"bizId\":\"zxy_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"62113651314\",\"timestamp\":1714793834886}','completed','2024-05-04 11:37:14','2024-05-04 11:37:14'),
    (180,'zxy','send_rebate','72477008662','{\"data\":{\"bizId\":\"zxy_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"72477008662\",\"timestamp\":1714793967664}','completed','2024-05-04 11:39:27','2024-05-04 11:39:27'),
    (181,'zxy','send_rebate','21764530878','{\"data\":{\"bizId\":\"zxy_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"21764530878\",\"timestamp\":1714793967664}','completed','2024-05-04 11:39:27','2024-05-04 11:39:27'),
    (182,'zxy','send_rebate','81400180382','{\"data\":{\"bizId\":\"zxy_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"zxy\"},\"id\":\"81400180382\",\"timestamp\":1714794000070}','completed','2024-05-04 11:40:00','2024-05-04 11:40:00'),
    (183,'zxy','send_rebate','54229506227','{\"data\":{\"bizId\":\"zxy_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"54229506227\",\"timestamp\":1714794000070}','completed','2024-05-04 11:40:00','2024-05-04 11:40:00'),
    (184,'zxy','send_award','65328722154','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"65328722154\",\"timestamp\":1714794009904}','completed','2024-05-04 11:40:09','2024-05-04 11:40:09'),
    (185,'zxy','send_award','24734850097','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"zxy\"},\"id\":\"24734850097\",\"timestamp\":1714794017003}','completed','2024-05-04 11:40:17','2024-05-04 11:40:17'),
    (186,'zxy','send_award','83062798647','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"zxy\"},\"id\":\"83062798647\",\"timestamp\":1714798160372}','completed','2024-05-04 12:49:20','2024-05-04 12:49:20'),
    (187,'zxy','send_award','17077466970','{\"data\":{\"awardId\":105,\"awardTitle\":\"PS5\",\"userId\":\"zxy\"},\"id\":\"17077466970\",\"timestamp\":1714798170291}','completed','2024-05-04 12:49:30','2024-05-04 12:49:30'),
    (188,'zxy','send_award','96584733524','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"userId\":\"zxy\"},\"id\":\"96584733524\",\"timestamp\":1714798182051}','completed','2024-05-04 12:49:42','2024-05-04 12:49:42'),
    (189,'zxy','send_award','96383900014','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"userId\":\"zxy\"},\"id\":\"96383900014\",\"timestamp\":1714798235777}','completed','2024-05-04 12:50:35','2024-05-04 12:50:35'),
    (190,'zxy','send_award','75247980575','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"userId\":\"zxy\"},\"id\":\"75247980575\",\"timestamp\":1714798244410}','completed','2024-05-04 12:50:44','2024-05-04 12:50:44'),
    (191,'zxy','send_award','83936855188','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"userId\":\"zxy\"},\"id\":\"83936855188\",\"timestamp\":1714807768291}','completed','2024-05-04 15:29:28','2024-05-04 15:29:28'),
    (192,'zxy','send_award','05844230229','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"zxy\"},\"id\":\"05844230229\",\"timestamp\":1714807775839}','completed','2024-05-04 15:29:35','2024-05-04 15:29:35'),
    (193,'zxy','send_award','34200100481','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"userId\":\"zxy\"},\"id\":\"34200100481\",\"timestamp\":1714807782994}','completed','2024-05-04 15:29:42','2024-05-04 15:29:43'),
    (194,'zxy','send_award','51137440950','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"zxy\"},\"id\":\"51137440950\",\"timestamp\":1714807789760}','completed','2024-05-04 15:29:49','2024-05-04 15:29:49'),
    (195,'zxy','send_award','74638782814','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"userId\":\"zxy\"},\"id\":\"74638782814\",\"timestamp\":1714807796220}','completed','2024-05-04 15:29:56','2024-05-04 15:29:56'),
    (196,'liergou','send_rebate','36637930434','{\"data\":{\"bizId\":\"liergou_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"liergou\"},\"id\":\"36637930434\",\"timestamp\":1714807821210}','completed','2024-05-04 15:30:21','2024-05-04 15:30:21'),
    (197,'liergou','send_rebate','34715403057','{\"data\":{\"bizId\":\"liergou_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"liergou\"},\"id\":\"34715403057\",\"timestamp\":1714807821216}','completed','2024-05-04 15:30:21','2024-05-04 15:30:21'),
    (198,'liergou','send_award','41597520105','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou\"},\"id\":\"41597520105\",\"timestamp\":1714807836090}','completed','2024-05-04 15:30:36','2024-05-04 15:30:36'),
    (199,'liergou','send_award','58675423754','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"userId\":\"liergou\"},\"id\":\"58675423754\",\"timestamp\":1714807877112}','completed','2024-05-04 15:31:17','2024-05-04 15:31:17'),
    (200,'liergou','send_award','99730641621','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"liergou\"},\"id\":\"99730641621\",\"timestamp\":1714807884267}','completed','2024-05-04 15:31:24','2024-05-04 15:31:24'),
    (201,'liergou','send_award','92898084117','{\"data\":{\"awardId\":108,\"awardTitle\":\"温馨玩偶\",\"userId\":\"liergou\"},\"id\":\"92898084117\",\"timestamp\":1714807891073}','completed','2024-05-04 15:31:31','2024-05-04 15:31:31'),
    (202,'liergou','send_award','86334494433','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"userId\":\"liergou\"},\"id\":\"86334494433\",\"timestamp\":1714807898099}','completed','2024-05-04 15:31:38','2024-05-04 15:31:38'),
    (203,'liergou','send_award','51619066227','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"userId\":\"liergou\"},\"id\":\"51619066227\",\"timestamp\":1714807905011}','completed','2024-05-04 15:31:45','2024-05-04 15:31:45'),
    (204,'liergou','send_award','05800486959','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"userId\":\"liergou\"},\"id\":\"05800486959\",\"timestamp\":1714807911983}','completed','2024-05-04 15:31:51','2024-05-04 15:31:51'),
    (205,'liergou','send_award','94809887830','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"liergou\"},\"id\":\"94809887830\",\"timestamp\":1714807919539}','completed','2024-05-04 15:31:59','2024-05-04 15:31:59'),
    (206,'liergou','send_award','45867676557','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou\"},\"id\":\"45867676557\",\"timestamp\":1714807926510}','completed','2024-05-04 15:32:06','2024-05-04 15:32:06'),
    (207,'liergou','send_award','06153737578','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"liergou\"},\"id\":\"06153737578\",\"timestamp\":1714807933146}','completed','2024-05-04 15:32:13','2024-05-04 15:32:13'),
    (208,'liergou','send_rebate','70974160126','{\"data\":{\"bizId\":\"liergou_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"liergou\"},\"id\":\"70974160126\",\"timestamp\":1714807945762}','completed','2024-05-04 15:32:25','2024-05-04 15:32:25'),
    (209,'liergou','send_rebate','02138996837','{\"data\":{\"bizId\":\"liergou_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"liergou\"},\"id\":\"02138996837\",\"timestamp\":1714807945762}','completed','2024-05-04 15:32:25','2024-05-04 15:32:25'),
    (210,'liergou','send_award','94421726702','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"liergou\"},\"id\":\"94421726702\",\"timestamp\":1714807949401}','completed','2024-05-04 15:32:29','2024-05-04 15:32:29'),
    (211,'liergou','send_award','39472863610','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"liergou\"},\"id\":\"39472863610\",\"timestamp\":1714807955879}','completed','2024-05-04 15:32:35','2024-05-04 15:32:35'),
    (212,'liergou','send_award','87066045962','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"liergou\"},\"id\":\"87066045962\",\"timestamp\":1714807962247}','completed','2024-05-04 15:32:42','2024-05-04 15:32:42'),
    (213,'liergou','send_award','71295562520','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"liergou\"},\"id\":\"71295562520\",\"timestamp\":1714808050789}','completed','2024-05-04 15:34:10','2024-05-04 15:34:10'),
    (214,'liergou2','send_rebate','69657914070','{\"data\":{\"bizId\":\"liergou2_sku_20240504\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"liergou2\"},\"id\":\"69657914070\",\"timestamp\":1714808152671}','completed','2024-05-04 15:35:52','2024-05-04 15:35:52'),
    (215,'liergou2','send_rebate','98631727300','{\"data\":{\"bizId\":\"liergou2_integral_20240504\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"liergou2\"},\"id\":\"98631727300\",\"timestamp\":1714808152672}','completed','2024-05-04 15:35:52','2024-05-04 15:35:52'),
    (216,'liergou2','send_award','04455448797','{\"data\":{\"awardId\":108,\"awardTitle\":\"温馨玩偶\",\"userId\":\"liergou2\"},\"id\":\"04455448797\",\"timestamp\":1714808156560}','completed','2024-05-04 15:35:56','2024-05-04 15:35:56'),
    (217,'liergou2','send_award','70112884978','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou2\"},\"id\":\"70112884978\",\"timestamp\":1714808163337}','completed','2024-05-04 15:36:03','2024-05-04 15:36:03'),
    (218,'liergou2','send_award','20013321724','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"liergou2\"},\"id\":\"20013321724\",\"timestamp\":1714808170383}','completed','2024-05-04 15:36:10','2024-05-04 15:36:10'),
    (219,'liergou2','send_award','69158770194','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou2\"},\"id\":\"69158770194\",\"timestamp\":1714808182013}','completed','2024-05-04 15:36:22','2024-05-04 15:36:22'),
    (220,'liergou2','send_award','79778986609','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou2\"},\"id\":\"79778986609\",\"timestamp\":1714808192767}','completed','2024-05-04 15:36:32','2024-05-04 15:36:32'),
    (221,'liergou2','send_award','99484906329','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"userId\":\"liergou2\"},\"id\":\"99484906329\",\"timestamp\":1714808199757}','completed','2024-05-04 15:36:39','2024-05-04 15:36:39'),
    (222,'liergou2','send_award','71461913030','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou2\"},\"id\":\"71461913030\",\"timestamp\":1714808206546}','completed','2024-05-04 15:36:46','2024-05-04 15:36:46'),
    (223,'liergou2','send_award','65660637245','{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"liergou2\"},\"id\":\"65660637245\",\"timestamp\":1714808213101}','completed','2024-05-04 15:36:53','2024-05-04 15:36:53'),
    (224,'liergou2','send_award','65599834779','{\"data\":{\"awardId\":108,\"awardTitle\":\"温馨玩偶\",\"userId\":\"liergou2\"},\"id\":\"65599834779\",\"timestamp\":1714808219849}','completed','2024-05-04 15:36:59','2024-05-04 15:36:59'),
    (225,'liergou2','send_award','56578189655','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"liergou2\"},\"id\":\"56578189655\",\"timestamp\":1714808226524}','completed','2024-05-04 15:37:06','2024-05-04 15:37:06'),
    (226,'liergou2','send_award','93238638633','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"liergou2\"},\"id\":\"93238638633\",\"timestamp\":1714808233335}','completed','2024-05-04 15:37:13','2024-05-04 15:37:13'),
    (227,'liergou2','send_award','08920326769','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"userId\":\"liergou2\"},\"id\":\"08920326769\",\"timestamp\":1714808240830}','completed','2024-05-04 15:37:20','2024-05-04 15:37:20'),
    (228,'liergou2','send_award','23064270642','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"liergou2\"},\"id\":\"23064270642\",\"timestamp\":1714808248052}','completed','2024-05-04 15:37:28','2024-05-04 15:37:28'),
    (229,'liergou2','send_award','25530792328','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"userId\":\"liergou2\"},\"id\":\"25530792328\",\"timestamp\":1714808257717}','completed','2024-05-04 15:37:37','2024-05-04 15:37:37'),
    (230,'user003','send_rebate','76631988985','{\"data\":{\"bizId\":\"user003_sku_20240525\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"user003\"},\"id\":\"76631988985\",\"timestamp\":1716605538812}','completed','2024-05-25 10:52:19','2024-05-25 10:52:19'),
    (231,'user003','send_rebate','97630347951','{\"data\":{\"bizId\":\"user003_integral_20240525\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"user003\"},\"id\":\"97630347951\",\"timestamp\":1716605538817}','completed','2024-05-25 10:52:19','2024-05-25 10:52:19'),
    (232,'user003','send_award','22110596663','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"248641902208\",\"userId\":\"user003\"},\"id\":\"22110596663\",\"timestamp\":1716605600148}','completed','2024-05-25 10:53:20','2024-05-25 10:53:20'),
    (233,'user003','send_award','55709995622','{\"data\":{\"awardConfig\":\"0.01,1\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"020196190863\",\"userId\":\"user003\"},\"id\":\"55709995622\",\"timestamp\":1716605670613}','completed','2024-05-25 10:54:31','2024-05-25 10:54:31'),
    (234,'zxy','send_award','79454943847','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"orderId\":\"472964574229\",\"userId\":\"zxy\"},\"id\":\"79454943847\",\"timestamp\":1717025041975}','completed','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (235,'zxy','send_award','09860278655','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"orderId\":\"096000668706\",\"userId\":\"zxy\"},\"id\":\"09860278655\",\"timestamp\":1717025042498}','completed','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (236,'zxy','send_award','43408061670','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"orderId\":\"053808941529\",\"userId\":\"zxy\"},\"id\":\"43408061670\",\"timestamp\":1717025042660}','completed','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (237,'zxy','send_award','98270300001','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"orderId\":\"546003504055\",\"userId\":\"zxy\"},\"id\":\"98270300001\",\"timestamp\":1717025042832}','completed','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (238,'zxy','send_award','19901700385','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"orderId\":\"531425424850\",\"userId\":\"zxy\"},\"id\":\"19901700385\",\"timestamp\":1717025042964}','completed','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (239,'zxy','send_rebate','99298867364','{\"data\":{\"bizId\":\"zxy_integral_20240601001\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"99298867364\",\"timestamp\":1717210140295}','completed','2024-06-01 10:49:00','2024-06-01 10:49:00'),
    (240,'zxy','send_rebate','84156214268','{\"data\":{\"bizId\":\"zxy_integral_20240601002\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"84156214268\",\"timestamp\":1717210318593}','completed','2024-06-01 10:51:58','2024-06-01 10:52:03'),
    (241,'zxy','send_rebate','74711058753','{\"data\":{\"bizId\":\"zxy_integral_20240601003\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"74711058753\",\"timestamp\":1717210372351}','completed','2024-06-01 10:52:52','2024-06-01 10:52:52'),
    (242,'zxy','send_rebate','11611351139','{\"data\":{\"bizId\":\"zxy_integral_20240601004\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"11611351139\",\"timestamp\":1717210470349}','completed','2024-06-01 10:54:30','2024-06-01 10:55:17'),
    (243,'zxy','send_rebate','53202882014','{\"data\":{\"bizId\":\"zxy_integral_20240601005\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"53202882014\",\"timestamp\":1717210629229}','completed','2024-06-01 10:57:09','2024-06-01 10:57:09'),
    (244,'zxy','send_rebate','61165550239','{\"data\":{\"bizId\":\"zxy_integral_20240601006\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"61165550239\",\"timestamp\":1717210827931}','completed','2024-06-01 11:00:28','2024-06-01 11:00:31'),
    (245,'zxy','send_rebate','67030345130','{\"data\":{\"bizId\":\"zxy_integral_20240601101\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"67030345130\",\"timestamp\":1717221767862}','completed','2024-06-01 14:02:48','2024-06-01 14:02:48'),
    (246,'zxy','credit_adjust_success','42778910768','{\"data\":{\"amount\":-1.68,\"orderId\":\"313070417337\",\"outBusinessNo\":\"70009240608003\",\"userId\":\"zxy\"},\"id\":\"42778910768\",\"timestamp\":1717849623150}','completed','2024-06-08 20:27:03','2024-06-08 20:27:15'),
    (247,'zxy','credit_adjust_success','53121094706','{\"data\":{\"amount\":-1.68,\"orderId\":\"956437348272\",\"outBusinessNo\":\"70009240608007\",\"userId\":\"zxy\"},\"id\":\"53121094706\",\"timestamp\":1717850053164}','completed','2024-06-08 20:34:13','2024-06-08 20:34:13'),
    (248,'zxy','credit_adjust_success','04087257219','{\"data\":{\"amount\":-1.68,\"orderId\":\"825697847616\",\"outBusinessNo\":\"70009240609001\",\"userId\":\"zxy\"},\"id\":\"04087257219\",\"timestamp\":1717895483369}','completed','2024-06-09 09:11:23','2024-06-09 09:11:24'),
    (249,'zxy','credit_adjust_success','50806088557','{\"data\":{\"amount\":-1.68,\"orderId\":\"528225981137\",\"outBusinessNo\":\"70009240610002\",\"userId\":\"zxy\"},\"id\":\"50806088557\",\"timestamp\":1717901110572}','completed','2024-06-09 10:45:11','2024-06-09 10:45:11'),
    (250,'zxy','send_award','26927754819','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"orderId\":\"101866910505\",\"userId\":\"zxy\"},\"id\":\"26927754819\",\"timestamp\":1717922288328}','completed','2024-06-09 16:38:08','2024-06-09 16:38:08'),
    (251,'zxy','send_award','46601016382','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"orderId\":\"982300492592\",\"userId\":\"zxy\"},\"id\":\"46601016382\",\"timestamp\":1717922357941}','completed','2024-06-09 16:39:18','2024-06-09 16:39:18'),
    (252,'zxy','send_award','22347117561','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"orderId\":\"910742677700\",\"userId\":\"zxy\"},\"id\":\"22347117561\",\"timestamp\":1717922426837}','completed','2024-06-09 16:40:27','2024-06-09 16:40:27'),
    (253,'zxy','send_award','58851591615','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"orderId\":\"491443986394\",\"userId\":\"zxy\"},\"id\":\"58851591615\",\"timestamp\":1717922910000}','completed','2024-06-09 16:48:30','2024-06-09 16:48:30'),
    (254,'zxy','send_award','90231733191','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"orderId\":\"185144859882\",\"userId\":\"zxy\"},\"id\":\"90231733191\",\"timestamp\":1717923112036}','completed','2024-06-09 16:51:52','2024-06-09 16:51:52'),
    (255,'zxy','send_award','34803792655','{\"data\":{\"awardId\":106,\"awardTitle\":\"轻奢办公椅\",\"orderId\":\"824053366847\",\"userId\":\"zxy\"},\"id\":\"34803792655\",\"timestamp\":1717923291510}','completed','2024-06-09 16:54:51','2024-06-09 16:54:51'),
    (256,'zxy','send_award','95397769059','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"orderId\":\"261041879408\",\"userId\":\"zxy\"},\"id\":\"95397769059\",\"timestamp\":1717923424701}','completed','2024-06-09 16:57:04','2024-06-09 16:57:04'),
    (257,'zxy','send_award','37263373718','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"orderId\":\"347687076714\",\"userId\":\"zxy\"},\"id\":\"37263373718\",\"timestamp\":1717926604262}','completed','2024-06-09 17:50:04','2024-06-09 17:50:04'),
    (258,'zxy','send_award','59545478396','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"orderId\":\"686437761355\",\"userId\":\"zxy\"},\"id\":\"59545478396\",\"timestamp\":1717927280830}','completed','2024-06-09 18:01:21','2024-06-09 18:01:21'),
    (259,'zxy','send_award','08906900453','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"orderId\":\"785085017376\",\"userId\":\"zxy\"},\"id\":\"08906900453\",\"timestamp\":1717929883683}','completed','2024-06-09 18:44:43','2024-06-09 18:44:43'),
    (260,'zxy','send_award','69014264277','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"orderId\":\"621539805309\",\"userId\":\"zxy\"},\"id\":\"69014264277\",\"timestamp\":1717978615661}','completed','2024-06-10 08:16:55','2024-06-10 08:16:56'),
    (261,'zxy','send_award','80351397542','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"orderId\":\"409116465954\",\"userId\":\"zxy\"},\"id\":\"80351397542\",\"timestamp\":1717983120987}','completed','2024-06-10 09:32:01','2024-06-10 09:32:01'),
    (262,'zxy','send_award','17346228082','{\"data\":{\"awardConfig\":\"1,100\",\"awardId\":101,\"awardTitle\":\"随机积分\",\"orderId\":\"425949139982\",\"userId\":\"zxy\"},\"id\":\"17346228082\",\"timestamp\":1717983121787}','completed','2024-06-10 09:32:01','2024-06-10 09:32:01'),
    (263,'zxy','send_award','78676905226','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"orderId\":\"495003911464\",\"userId\":\"zxy\"},\"id\":\"78676905226\",\"timestamp\":1717983122042}','completed','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (264,'zxy','send_award','48405748157','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"orderId\":\"995078901219\",\"userId\":\"zxy\"},\"id\":\"48405748157\",\"timestamp\":1717983122250}','completed','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (265,'zxy','send_award','67359117900','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"orderId\":\"858859626738\",\"userId\":\"zxy\"},\"id\":\"67359117900\",\"timestamp\":1717983122494}','completed','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (266,'zxy','send_award','90382887428','{\"data\":{\"awardId\":104,\"awardTitle\":\"温馨台灯\",\"orderId\":\"053708718603\",\"userId\":\"zxy\"},\"id\":\"90382887428\",\"timestamp\":1717983122667}','completed','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (267,'zxy','send_award','28629141959','{\"data\":{\"awardId\":107,\"awardTitle\":\"华为耳机\",\"orderId\":\"297260334918\",\"userId\":\"zxy\"},\"id\":\"28629141959\",\"timestamp\":1717983122882}','completed','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (268,'zxy','send_award','87621753567','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"orderId\":\"167963236057\",\"userId\":\"zxy\"},\"id\":\"87621753567\",\"timestamp\":1717983123033}','completed','2024-06-10 09:32:03','2024-06-10 09:32:03'),
    (269,'zxy','send_award','19681781897','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"orderId\":\"653777558291\",\"userId\":\"zxy\"},\"id\":\"19681781897\",\"timestamp\":1717983123178}','completed','2024-06-10 09:32:03','2024-06-10 09:32:03'),
    (270,'zxy','send_award','56368602597','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"orderId\":\"281047495461\",\"userId\":\"zxy\"},\"id\":\"56368602597\",\"timestamp\":1717983123377}','completed','2024-06-10 09:32:03','2024-06-10 09:32:03'),
    (271,'zxy','send_award','42947550170','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"orderId\":\"880920828501\",\"userId\":\"zxy\"},\"id\":\"42947550170\",\"timestamp\":1717983223442}','completed','2024-06-10 09:33:43','2024-06-10 09:33:44'),
    (272,'zxy','send_award','25433533860','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"orderId\":\"082869528704\",\"userId\":\"zxy\"},\"id\":\"25433533860\",\"timestamp\":1717983330869}','completed','2024-06-10 09:35:31','2024-06-10 09:35:31'),
    (273,'zxy','send_award','88623042077','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"orderId\":\"775059128414\",\"userId\":\"zxy\"},\"id\":\"88623042077\",\"timestamp\":1717983384190}','completed','2024-06-10 09:36:24','2024-06-10 09:36:24'),
    (274,'zxy','send_award','70095826976','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"orderId\":\"156151328815\",\"userId\":\"zxy\"},\"id\":\"70095826976\",\"timestamp\":1717983384838}','completed','2024-06-10 09:36:24','2024-06-10 09:36:24'),
    (275,'zxy','send_award','48727596578','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"orderId\":\"118558329771\",\"userId\":\"zxy\"},\"id\":\"48727596578\",\"timestamp\":1717983385056}','completed','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (276,'zxy','send_award','33923911862','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"orderId\":\"427636834661\",\"userId\":\"zxy\"},\"id\":\"33923911862\",\"timestamp\":1717983385308}','completed','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (277,'zxy','send_award','89445645254','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"orderId\":\"135758549193\",\"userId\":\"zxy\"},\"id\":\"89445645254\",\"timestamp\":1717983385499}','completed','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (278,'zxy','send_award','40271574409','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"orderId\":\"596222110197\",\"userId\":\"zxy\"},\"id\":\"40271574409\",\"timestamp\":1717983385799}','completed','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (279,'zxy','send_award','42927059557','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"orderId\":\"133465033320\",\"userId\":\"zxy\"},\"id\":\"42927059557\",\"timestamp\":1717983385992}','completed','2024-06-10 09:36:25','2024-06-10 09:36:26'),
    (280,'zxy','send_award','17144609943','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"orderId\":\"473872104570\",\"userId\":\"zxy\"},\"id\":\"17144609943\",\"timestamp\":1717983386224}','completed','2024-06-10 09:36:26','2024-06-10 09:36:26'),
    (281,'zxy','send_award','30715094825','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"orderId\":\"423248249261\",\"userId\":\"zxy\"},\"id\":\"30715094825\",\"timestamp\":1717983386422}','completed','2024-06-10 09:36:26','2024-06-10 09:36:26'),
    (282,'zxy','send_award','38211485616','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"orderId\":\"308631038775\",\"userId\":\"zxy\"},\"id\":\"38211485616\",\"timestamp\":1717983386611}','completed','2024-06-10 09:36:26','2024-06-10 09:36:26'),
    (283,'zxy','credit_adjust_success','18537451448','{\"data\":{\"amount\":1.68,\"orderId\":\"564697903775\",\"outBusinessNo\":\"930967287605\",\"userId\":\"zxy\"},\"id\":\"18537451448\",\"timestamp\":1718421631362}','completed','2024-06-15 11:20:31','2024-06-15 11:20:31'),
    (284,'zxy','credit_adjust_success','40550073689','{\"data\":{\"amount\":1.68,\"orderId\":\"628209301378\",\"outBusinessNo\":\"737554528904\",\"userId\":\"zxy\"},\"id\":\"40550073689\",\"timestamp\":1718433988638}','completed','2024-06-15 14:46:29','2024-06-15 14:46:29'),
    (285,'zxy','send_award','20664492845','{\"data\":{\"awardId\":102,\"awardTitle\":\"AI-Agent一周体验卡\",\"orderId\":\"519396224936\",\"userId\":\"zxy\"},\"id\":\"20664492845\",\"timestamp\":1718452937177}','completed','2024-06-15 20:02:17','2024-06-15 20:02:17'),
    (286,'zxy','send_award','71555553172','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"orderId\":\"670420154694\",\"userId\":\"zxy\"},\"id\":\"71555553172\",\"timestamp\":1718453975872}','completed','2024-06-15 20:19:36','2024-06-15 20:19:36'),
    (287,'zxy','send_award','90817491211','{\"data\":{\"awardId\":103,\"awardTitle\":\"算法书籍\",\"orderId\":\"698760826583\",\"userId\":\"zxy\"},\"id\":\"90817491211\",\"timestamp\":1718453976598}','completed','2024-06-15 20:19:36','2024-06-15 20:19:36'),
    (288,'zxy','send_rebate','01818426310','{\"data\":{\"bizId\":\"zxy_integral_20240621\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"01818426310\",\"timestamp\":1718977807980}','completed','2024-06-21 21:50:08','2024-06-21 21:50:08'),
    (289,'zxy','credit_adjust_success','08341234374','{\"data\":{\"amount\":10,\"orderId\":\"783120384577\",\"outBusinessNo\":\"zxy_integral_20240621\",\"userId\":\"zxy\"},\"id\":\"08341234374\",\"timestamp\":1718977808400}','completed','2024-06-21 21:50:08','2024-06-21 21:50:08'),
    (290,'zxy','send_rebate','07126882927','{\"data\":{\"bizId\":\"zxy_integral_20240622\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy\"},\"id\":\"07126882927\",\"timestamp\":1719017605989}','completed','2024-06-22 08:53:26','2024-06-22 08:53:26'),
    (291,'zxy','credit_adjust_success','29078560886','{\"data\":{\"amount\":10,\"orderId\":\"629518620287\",\"outBusinessNo\":\"zxy_integral_20240622\",\"userId\":\"zxy\"},\"id\":\"29078560886\",\"timestamp\":1719017610679}','completed','2024-06-22 08:53:30','2024-06-22 08:53:30'),
    (292,'zxy','credit_adjust_success','17799929018','{\"data\":{\"amount\":-1.00,\"orderId\":\"569328797999\",\"outBusinessNo\":\"581102699959\",\"userId\":\"zxy\"},\"id\":\"17799929018\",\"timestamp\":1719019563097}','completed','2024-06-22 09:31:17','2024-06-22 09:31:17'),
    (293,'zxy','credit_adjust_success','95287430620','{\"data\":{\"amount\":-1.00,\"orderId\":\"181899571891\",\"outBusinessNo\":\"558549576217\",\"userId\":\"zxy\"},\"id\":\"95287430620\",\"timestamp\":1719020746528}','completed','2024-06-22 09:45:46','2024-06-22 09:45:46'),
    (294,'zxy','credit_adjust_success','00851412651','{\"data\":{\"amount\":-1.00,\"orderId\":\"887819413964\",\"outBusinessNo\":\"512408648536\",\"userId\":\"zxy\"},\"id\":\"00851412651\",\"timestamp\":1719020752255}','completed','2024-06-22 09:45:52','2024-06-22 09:45:52'),
    (295,'zxy','credit_adjust_success','67882279573','{\"data\":{\"amount\":-1.00,\"orderId\":\"876139557832\",\"outBusinessNo\":\"954851009052\",\"userId\":\"zxy\"},\"id\":\"67882279573\",\"timestamp\":1719020754236}','completed','2024-06-22 09:45:54','2024-06-22 09:45:54'),
    (296,'zxy','credit_adjust_success','95808375372','{\"data\":{\"amount\":-1.00,\"orderId\":\"369045346137\",\"outBusinessNo\":\"156304594063\",\"userId\":\"zxy\"},\"id\":\"95808375372\",\"timestamp\":1719020758207}','completed','2024-06-22 09:45:58','2024-06-22 09:45:58'),
    (297,'zxy','credit_adjust_success','97653280629','{\"data\":{\"amount\":-5.00,\"orderId\":\"896456690441\",\"outBusinessNo\":\"844410851560\",\"userId\":\"zxy\"},\"id\":\"97653280629\",\"timestamp\":1719020968120}','completed','2024-06-22 09:49:28','2024-06-22 09:49:28'),
    (298,'zxy','credit_adjust_success','04579107755','{\"data\":{\"amount\":-5.00,\"orderId\":\"781364485025\",\"outBusinessNo\":\"450478498484\",\"userId\":\"zxy\"},\"id\":\"04579107755\",\"timestamp\":1719020971511}','completed','2024-06-22 09:49:31','2024-06-22 09:49:31'),
    (299,'zxy26','send_rebate','47191139595','{\"data\":{\"bizId\":\"zxy26_sku_20240622\",\"rebateConfig\":\"9014\",\"rebateType\":\"sku\",\"userId\":\"zxy26\"},\"id\":\"47191139595\",\"timestamp\":1719022955379}','completed','2024-06-22 10:22:35','2024-06-22 10:22:35'),
    (300,'zxy26','send_rebate','58249350879','{\"data\":{\"bizId\":\"zxy26_integral_20240622\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"zxy26\"},\"id\":\"58249350879\",\"timestamp\":1719022955379}','completed','2024-06-22 10:22:35','2024-06-22 10:22:35'),
    (301,'zxy26','credit_adjust_success','72206280277','{\"data\":{\"amount\":10,\"orderId\":\"633312779415\",\"outBusinessNo\":\"zxy26_integral_20240622\",\"userId\":\"zxy26\"},\"id\":\"72206280277\",\"timestamp\":1719022955463}','completed','2024-06-22 10:22:35','2024-06-22 10:22:35'),
    (302,'zxy','credit_adjust_success','86345258917','{\"data\":{\"amount\":-5.00,\"orderId\":\"169352244168\",\"outBusinessNo\":\"489789224063\",\"userId\":\"zxy\"},\"id\":\"86345258917\",\"timestamp\":1719025862657}','completed','2024-06-22 11:11:02','2024-06-22 11:11:02');

/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_award_record_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_000`;

CREATE TABLE `user_award_record_000` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                         `award_id` int(11) NOT NULL COMMENT '奖品ID',
                                         `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
                                         `award_time` datetime NOT NULL COMMENT '中奖时间',
                                         `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id` (`user_id`),
                                         KEY `idx_activity_id` (`activity_id`),
                                         KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';



# 转储表 user_award_record_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_001`;

CREATE TABLE `user_award_record_001` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                         `award_id` int(11) NOT NULL COMMENT '奖品ID',
                                         `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
                                         `award_time` datetime NOT NULL COMMENT '中奖时间',
                                         `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id` (`user_id`),
                                         KEY `idx_activity_id` (`activity_id`),
                                         KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';

LOCK TABLES `user_award_record_001` WRITE;
/*!40000 ALTER TABLE `user_award_record_001` DISABLE KEYS */;

INSERT INTO `user_award_record_001` (`id`, `user_id`, `activity_id`, `strategy_id`, `order_id`, `award_id`, `award_title`, `award_time`, `award_state`, `create_time`, `update_time`)
VALUES
    (1,'zxy',100301,100006,'313091076458',101,'OpenAI 增加使用次数','2024-04-06 03:41:50','create','2024-04-06 11:41:50','2024-04-06 11:41:50'),
    (3,'zxy',100301,100006,'313091076459',101,'OpenAI 增加使用次数','2024-04-06 03:47:54','create','2024-04-06 11:47:54','2024-04-06 11:47:54'),
    (6,'zxy',100301,100006,'658772889112',101,'OpenAI 增加使用次数','2024-04-06 04:16:50','create','2024-04-06 12:16:50','2024-04-06 12:16:50'),
    (7,'zxy',100301,100006,'623291703218',101,'OpenAI 增加使用次数','2024-04-06 04:16:51','create','2024-04-06 12:16:50','2024-04-06 12:16:50'),
    (8,'zxy',100301,100006,'619841045154',101,'OpenAI 增加使用次数','2024-04-06 04:16:51','create','2024-04-06 12:16:51','2024-04-06 12:16:51'),
    (9,'zxy',100301,100006,'696947604604',101,'OpenAI 增加使用次数','2024-04-06 04:16:52','create','2024-04-06 12:16:51','2024-04-06 12:16:51'),
    (10,'zxy',100301,100006,'239997053403',101,'OpenAI 增加使用次数','2024-04-06 04:16:52','create','2024-04-06 12:16:52','2024-04-06 12:16:52'),
    (11,'zxy',100301,100006,'837228766840',101,'OpenAI 增加使用次数','2024-04-06 04:16:53','create','2024-04-06 12:16:52','2024-04-06 12:16:52'),
    (12,'zxy',100301,100006,'012609968231',101,'OpenAI 增加使用次数','2024-04-06 04:16:53','create','2024-04-06 12:16:53','2024-04-06 12:16:53'),
    (13,'zxy',100301,100006,'540056227059',101,'OpenAI 增加使用次数','2024-04-06 04:16:54','create','2024-04-06 12:16:54','2024-04-06 12:16:54'),
    (14,'zxy',100301,100006,'757384073568',101,'OpenAI 增加使用次数','2024-04-06 04:16:55','create','2024-04-06 12:16:54','2024-04-06 12:16:54'),
    (15,'zxy',100301,100006,'270533634609',101,'OpenAI 增加使用次数','2024-04-06 04:16:55','create','2024-04-06 12:16:55','2024-04-06 12:16:55'),
    (16,'zxy',100301,100006,'143517041178',101,'OpenAI 增加使用次数','2024-04-06 04:16:56','create','2024-04-06 12:16:55','2024-04-06 12:16:55'),
    (17,'zxy',100301,100006,'880610933571',101,'OpenAI 增加使用次数','2024-04-06 04:16:56','create','2024-04-06 12:16:56','2024-04-06 12:16:56'),
    (18,'zxy',100301,100006,'288939138548',101,'OpenAI 增加使用次数','2024-04-06 04:16:57','create','2024-04-06 12:16:56','2024-04-06 12:16:56'),
    (19,'zxy',100301,100006,'401825045013',101,'OpenAI 增加使用次数','2024-04-06 04:16:57','create','2024-04-06 12:16:57','2024-04-06 12:16:57'),
    (20,'zxy',100301,100006,'644483213191',101,'OpenAI 增加使用次数','2024-04-06 04:16:58','create','2024-04-06 12:16:57','2024-04-06 12:16:57'),
    (21,'zxy',100301,100006,'126942948062',101,'OpenAI 增加使用次数','2024-04-06 04:16:58','create','2024-04-06 12:16:58','2024-04-06 12:16:58'),
    (22,'zxy',100301,100006,'388415276639',101,'OpenAI 增加使用次数','2024-04-06 08:10:38','create','2024-04-06 16:10:38','2024-04-06 16:10:38'),
    (23,'zxy',100301,100006,'295404830039',101,'OpenAI 增加使用次数','2024-04-06 08:10:39','create','2024-04-06 16:10:39','2024-04-06 16:10:39'),
    (24,'zxy',100301,100006,'396378174546',101,'OpenAI 增加使用次数','2024-04-06 08:10:40','create','2024-04-06 16:10:39','2024-04-06 16:10:39'),
    (25,'zxy',100301,100006,'216034880115',101,'OpenAI 增加使用次数','2024-04-06 08:10:40','create','2024-04-06 16:10:40','2024-04-06 16:10:40'),
    (26,'zxy',100301,100006,'587083012812',101,'OpenAI 增加使用次数','2024-04-06 08:10:41','create','2024-04-06 16:10:40','2024-04-06 16:10:40'),
    (27,'zxy',100301,100006,'179931564604',101,'OpenAI 增加使用次数','2024-04-06 08:10:41','create','2024-04-06 16:10:41','2024-04-06 16:10:41'),
    (28,'zxy',100301,100006,'266603270575',101,'OpenAI 增加使用次数','2024-04-06 08:10:42','create','2024-04-06 16:10:41','2024-04-06 16:10:41'),
    (29,'zxy',100301,100006,'708306230375',101,'OpenAI 增加使用次数','2024-04-06 08:10:42','create','2024-04-06 16:10:42','2024-04-06 16:10:42'),
    (30,'zxy',100301,100006,'099363576226',101,'OpenAI 增加使用次数','2024-04-06 08:10:43','create','2024-04-06 16:10:42','2024-04-06 16:10:42'),
    (31,'zxy',100301,100006,'330354920093',101,'OpenAI 增加使用次数','2024-04-06 08:10:43','create','2024-04-06 16:10:43','2024-04-06 16:10:43'),
    (32,'zxy',100301,100006,'824752758415',101,'OpenAI 增加使用次数','2024-04-06 08:10:44','create','2024-04-06 16:10:43','2024-04-06 16:10:43'),
    (33,'zxy',100301,100006,'064058506146',101,'OpenAI 增加使用次数','2024-04-06 08:10:44','create','2024-04-06 16:10:44','2024-04-06 16:10:44'),
    (34,'zxy',100301,100006,'923475474250',101,'OpenAI 增加使用次数','2024-04-06 08:10:45','create','2024-04-06 16:10:44','2024-04-06 16:10:44'),
    (35,'zxy',100301,100006,'565064446034',101,'OpenAI 增加使用次数','2024-04-06 08:10:45','create','2024-04-06 16:10:45','2024-04-06 16:10:45'),
    (36,'zxy',100301,100006,'665449773785',101,'OpenAI 增加使用次数','2024-04-06 08:10:46','create','2024-04-06 16:10:45','2024-04-06 16:10:45'),
    (37,'zxy',100301,100006,'099294776536',101,'OpenAI 增加使用次数','2024-04-06 08:10:46','create','2024-04-06 16:10:46','2024-04-06 16:10:46'),
    (38,'zxy',100301,100006,'166766849249',101,'OpenAI 增加使用次数','2024-04-06 08:10:47','create','2024-04-06 16:10:47','2024-04-06 16:10:47'),
    (39,'zxy',100301,100006,'569856975978',107,'2等奖','2024-04-13 03:44:02','create','2024-04-13 11:44:01','2024-04-13 11:44:01'),
    (40,'zxy',100301,100006,'867136698684',103,'6等奖','2024-04-13 03:44:11','create','2024-04-13 11:44:10','2024-04-13 11:44:10'),
    (41,'zxy',100301,100006,'250425115608',101,'随机积分','2024-04-13 03:44:14','create','2024-04-13 11:44:14','2024-04-13 11:44:14'),
    (42,'zxy',100301,100006,'663910993767',106,'3等奖','2024-04-13 03:44:16','create','2024-04-13 11:44:15','2024-04-13 11:44:15'),
    (43,'zxy',100301,100006,'218374542905',106,'3等奖','2024-04-13 03:44:17','create','2024-04-13 11:44:16','2024-04-13 11:44:16'),
    (44,'zxy',100301,100006,'225714694474',104,'5等奖','2024-04-13 03:44:18','create','2024-04-13 11:44:17','2024-04-13 11:44:17'),
    (45,'zxy',100301,100006,'431167372778',102,'7等奖','2024-04-13 03:44:19','create','2024-04-13 11:44:18','2024-04-13 11:44:18'),
    (46,'zxy',100301,100006,'434079846497',103,'6等奖','2024-04-13 03:45:30','create','2024-04-13 11:45:29','2024-04-13 11:45:29'),
    (47,'zxy',100301,100006,'965685676429',102,'7等奖','2024-04-13 03:45:31','create','2024-04-13 11:45:30','2024-04-13 11:45:30'),
    (48,'zxy',100301,100006,'940273728363',102,'7等奖','2024-04-13 04:14:53','create','2024-04-13 12:14:53','2024-04-13 12:14:53'),
    (49,'zxy',100301,100006,'240699246294',104,'5等奖','2024-04-13 04:17:34','create','2024-04-13 12:17:33','2024-04-13 12:17:33'),
    (50,'zxy',100301,100006,'298101180210',103,'6等奖','2024-04-13 04:18:17','create','2024-04-13 12:18:16','2024-04-13 12:18:16'),
    (51,'zxy',100301,100006,'565655944488',103,'6等奖','2024-04-13 04:18:23','create','2024-04-13 12:18:23','2024-04-13 12:18:23'),
    (52,'zxy',100301,100006,'090289257534',104,'5等奖','2024-04-13 04:18:25','create','2024-04-13 12:18:24','2024-04-13 12:18:24'),
    (53,'zxy',100301,100006,'668356046426',105,'4等奖','2024-04-13 04:18:26','create','2024-04-13 12:18:25','2024-04-13 12:18:25'),
    (54,'zxy',100301,100006,'745680068300',107,'2等奖','2024-04-13 04:18:37','create','2024-04-13 12:18:36','2024-04-13 12:18:36'),
    (55,'zxy',100301,100006,'285300597983',102,'7等奖','2024-04-13 04:20:08','create','2024-04-13 12:20:07','2024-04-13 12:20:07'),
    (56,'zxy',100301,100006,'999361306023',104,'5等奖','2024-04-13 04:20:10','create','2024-04-13 12:20:09','2024-04-13 12:20:09'),
    (57,'zxy',100301,100006,'063682699381',104,'5等奖','2024-04-13 04:20:14','create','2024-04-13 12:20:13','2024-04-13 12:20:13'),
    (58,'zxy',100301,100006,'680488311338',105,'4等奖','2024-04-13 04:20:15','create','2024-04-13 12:20:14','2024-04-13 12:20:14'),
    (59,'zxy',100301,100006,'399058527457',102,'7等奖','2024-04-13 04:20:16','create','2024-04-13 12:20:16','2024-04-13 12:20:16'),
    (60,'zxy',100301,100006,'579122416749',106,'3等奖','2024-04-13 04:20:21','create','2024-04-13 12:20:20','2024-04-13 12:20:20'),
    (61,'zxy',100301,100006,'854484054432',102,'7等奖','2024-04-13 06:03:59','create','2024-04-13 14:03:59','2024-04-13 14:03:59'),
    (62,'zxy',100301,100006,'066823147917',104,'5等奖','2024-04-13 07:25:06','create','2024-04-13 15:25:06','2024-04-13 15:25:06'),
    (63,'zxy',100301,100006,'022620846137',102,'7等奖','2024-04-13 07:25:11','create','2024-04-13 15:25:11','2024-04-13 15:25:11'),
    (64,'zxy',100301,100006,'605666354632',101,'随机积分','2024-04-13 07:25:12','create','2024-04-13 15:25:12','2024-04-13 15:25:12'),
    (65,'zxy',100301,100006,'604661560037',107,'2等奖','2024-04-13 07:25:21','create','2024-04-13 15:25:21','2024-04-13 15:25:21'),
    (66,'zxy',100301,100006,'212448652580',105,'4等奖','2024-04-20 04:09:31','create','2024-04-20 12:09:30','2024-04-20 12:09:30'),
    (67,'zxy',100301,100006,'356729331179',106,'3等奖','2024-04-20 04:11:24','create','2024-04-20 12:11:24','2024-04-20 12:11:24'),
    (68,'zxy',100301,100006,'102669494145',105,'4等奖','2024-04-20 07:10:58','create','2024-04-20 15:10:58','2024-04-20 15:10:58'),
    (69,'zxy',100301,100006,'730186113832',107,'2等奖','2024-04-20 07:43:13','create','2024-04-20 15:43:13','2024-04-20 15:43:13'),
    (70,'zxy',100301,100006,'472281891603',106,'3等奖','2024-04-20 08:50:39','create','2024-04-20 16:50:39','2024-04-20 16:50:39'),
    (71,'zxy',100301,100006,'931181504757',108,'温馨玩偶','2024-04-27 05:19:39','create','2024-04-27 13:19:38','2024-04-27 13:19:38'),
    (72,'zxy',100301,100006,'664993621684',101,'随机积分','2024-04-27 05:27:17','create','2024-04-27 13:27:17','2024-04-27 13:27:17'),
    (73,'zxy',100301,100006,'757674779249',104,'温馨台灯','2024-04-27 05:27:45','create','2024-04-27 13:27:45','2024-04-27 13:27:45'),
    (74,'zxy',100301,100006,'623885952534',102,'AI-Agent一周体验卡','2024-04-27 05:28:02','create','2024-04-27 13:28:01','2024-04-27 13:28:01'),
    (75,'zxy',100301,100006,'351875766756',106,'轻奢办公椅','2024-04-27 05:29:05','create','2024-04-27 13:29:05','2024-04-27 13:29:05'),
    (76,'zxy',100301,100006,'803227763198',103,'算法书籍','2024-04-27 05:29:32','create','2024-04-27 13:29:31','2024-04-27 13:29:31'),
    (77,'zxy',100301,100006,'587527322073',106,'轻奢办公椅','2024-04-27 05:29:57','create','2024-04-27 13:29:57','2024-04-27 13:29:57'),
    (78,'zxy',100301,100006,'552928609772',107,'华为耳机','2024-04-27 05:30:11','create','2024-04-27 13:30:11','2024-04-27 13:30:11'),
    (79,'zxy',100301,100006,'407462568156',107,'华为耳机','2024-04-27 05:36:27','create','2024-04-27 13:36:27','2024-04-27 13:36:27'),
    (80,'zxy',100301,100006,'688519386935',101,'随机积分','2024-04-27 05:38:00','create','2024-04-27 13:38:00','2024-04-27 13:38:00'),
    (81,'zxy',100301,100006,'148984382545',104,'温馨台灯','2024-04-27 05:38:56','create','2024-04-27 13:38:55','2024-04-27 13:38:55'),
    (82,'zxy',100301,100006,'410701479648',101,'随机积分','2024-04-27 05:39:18','create','2024-04-27 13:39:18','2024-04-27 13:39:18'),
    (83,'zxy',100301,100006,'521226371540',101,'随机积分','2024-04-27 06:59:56','create','2024-04-27 14:59:56','2024-04-27 14:59:56'),
    (84,'zxy',100301,100006,'167000751553',102,'AI-Agent一周体验卡','2024-04-27 07:00:14','create','2024-04-27 15:00:14','2024-04-27 15:00:14'),
    (85,'zxy',100301,100006,'685179511666',104,'温馨台灯','2024-04-27 07:00:23','create','2024-04-27 15:00:22','2024-04-27 15:00:22'),
    (86,'zxy',100301,100006,'308424817839',108,'温馨玩偶','2024-05-01 06:57:39','create','2024-05-01 14:57:39','2024-05-01 14:57:39'),
    (87,'zxy',100301,100006,'116865823300',101,'随机积分','2024-05-01 06:58:09','create','2024-05-01 14:58:08','2024-05-01 14:58:08'),
    (88,'zxy',100301,100006,'272157347851',107,'华为耳机','2024-05-01 06:59:33','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (89,'zxy',100301,100006,'400772556300',103,'算法书籍','2024-05-01 06:59:33','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (90,'zxy',100301,100006,'494705137752',101,'随机积分','2024-05-01 06:59:33','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (91,'zxy',100301,100006,'728609897262',106,'轻奢办公椅','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (92,'zxy',100301,100006,'085750418120',104,'温馨台灯','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (93,'zxy',100301,100006,'884615410376',107,'华为耳机','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (94,'zxy',100301,100006,'380693771158',107,'华为耳机','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (95,'zxy',100301,100006,'801793933954',103,'算法书籍','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (96,'zxy',100301,100006,'153569048026',108,'温馨玩偶','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (97,'zxy',100301,100006,'239541957386',108,'温馨玩偶','2024-05-01 06:59:34','create','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (98,'zxy',100301,100006,'417247136950',108,'温馨玩偶','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (99,'zxy',100301,100006,'556248667355',107,'华为耳机','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (100,'zxy',100301,100006,'828955445464',107,'华为耳机','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (101,'zxy',100301,100006,'756110942449',102,'AI-Agent一周体验卡','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (102,'zxy',100301,100006,'440069371435',101,'随机积分','2024-05-01 06:59:34','completed','2024-05-01 14:59:34','2024-05-24 22:11:59'),
    (103,'zxy',100301,100006,'421594084633',108,'温馨玩偶','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (104,'zxy',100301,100006,'500905040429',104,'温馨台灯','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (105,'zxy',100301,100006,'712386571628',101,'随机积分','2024-05-01 06:59:34','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (106,'zxy',100301,100006,'095923542021',108,'温馨玩偶','2024-05-01 06:59:35','create','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (107,'zxy',100301,100006,'306233708878',104,'温馨台灯','2024-05-03 01:02:18','create','2024-05-03 09:02:17','2024-05-03 09:02:17'),
    (108,'zxy',100301,100006,'690124733440',101,'随机积分','2024-05-03 01:09:57','completed','2024-05-03 09:09:57','2024-05-24 22:14:22'),
    (109,'zxy',100301,100006,'190487161872',102,'AI-Agent一周体验卡','2024-05-03 01:10:35','create','2024-05-03 09:10:35','2024-05-03 09:10:35'),
    (110,'zxy',100301,100006,'693117324295',102,'AI-Agent一周体验卡','2024-05-03 01:11:38','create','2024-05-03 09:11:38','2024-05-03 09:11:38'),
    (111,'zxy',100301,100006,'216557006872',107,'华为耳机','2024-05-04 01:32:11','create','2024-05-04 09:32:10','2024-05-04 09:32:10'),
    (112,'zxy',100301,100006,'769208157430',105,'PS5','2024-05-04 01:42:11','create','2024-05-04 09:42:11','2024-05-04 09:42:11'),
    (113,'zxy',100301,100006,'122549611053',102,'AI-Agent一周体验卡','2024-05-04 02:06:40','create','2024-05-04 10:06:40','2024-05-04 10:06:40'),
    (114,'zxy',100301,100006,'098077770962',102,'AI-Agent一周体验卡','2024-05-04 02:07:37','create','2024-05-04 10:07:36','2024-05-04 10:07:36'),
    (115,'zxy',100301,100006,'783440464441',102,'AI-Agent一周体验卡','2024-05-04 02:07:45','create','2024-05-04 10:07:44','2024-05-04 10:07:44'),
    (116,'zxy',100301,100006,'311741760661',102,'AI-Agent一周体验卡','2024-05-04 02:15:21','create','2024-05-04 10:15:21','2024-05-04 10:15:21'),
    (117,'zxy',100301,100006,'882852499238',102,'AI-Agent一周体验卡','2024-05-04 02:15:29','create','2024-05-04 10:15:29','2024-05-04 10:15:29'),
    (118,'zxy',100301,100006,'815259576049',102,'AI-Agent一周体验卡','2024-05-04 02:16:51','create','2024-05-04 10:16:51','2024-05-04 10:16:51'),
    (119,'zxy',100301,100006,'398933081979',102,'AI-Agent一周体验卡','2024-05-04 02:17:20','create','2024-05-04 10:17:19','2024-05-04 10:17:19'),
    (120,'zxy',100301,100006,'724477812186',102,'AI-Agent一周体验卡','2024-05-04 02:18:09','create','2024-05-04 10:18:09','2024-05-04 10:18:09'),
    (121,'zxy',100301,100006,'963415104251',102,'AI-Agent一周体验卡','2024-05-04 02:20:46','create','2024-05-04 10:20:46','2024-05-04 10:20:46'),
    (122,'zxy',100301,100006,'406832687477',102,'AI-Agent一周体验卡','2024-05-04 02:20:54','create','2024-05-04 10:20:54','2024-05-04 10:20:54'),
    (123,'zxy',100301,100006,'683420026858',102,'AI-Agent一周体验卡','2024-05-04 02:36:33','create','2024-05-04 10:36:32','2024-05-04 10:36:32'),
    (124,'zxy',100301,100006,'022379743786',102,'AI-Agent一周体验卡','2024-05-04 02:37:25','create','2024-05-04 10:37:25','2024-05-04 10:37:25'),
    (125,'zxy',100301,100006,'005727284053',102,'AI-Agent一周体验卡','2024-05-04 02:37:32','create','2024-05-04 10:37:32','2024-05-04 10:37:32'),
    (126,'zxy',100301,100006,'157097996505',102,'AI-Agent一周体验卡','2024-05-04 02:37:40','create','2024-05-04 10:37:39','2024-05-04 10:37:39'),
    (127,'zxy',100301,100006,'286115274205',102,'AI-Agent一周体验卡','2024-05-04 02:38:41','create','2024-05-04 10:38:41','2024-05-04 10:38:41'),
    (128,'zxy',100301,100006,'714442509117',102,'AI-Agent一周体验卡','2024-05-04 02:38:49','create','2024-05-04 10:38:49','2024-05-04 10:38:49'),
    (129,'zxy',100301,100006,'124268508437',102,'AI-Agent一周体验卡','2024-05-04 03:30:47','create','2024-05-04 11:30:47','2024-05-04 11:30:47'),
    (130,'zxy',100301,100006,'024028065395',102,'AI-Agent一周体验卡','2024-05-04 03:40:10','create','2024-05-04 11:40:09','2024-05-04 11:40:09'),
    (131,'zxy',100301,100006,'011132554981',102,'AI-Agent一周体验卡','2024-05-04 03:40:17','create','2024-05-04 11:40:17','2024-05-04 11:40:17'),
    (132,'zxy',100301,100006,'748409799526',103,'算法书籍','2024-05-04 04:49:20','create','2024-05-04 12:49:20','2024-05-04 12:49:20'),
    (133,'zxy',100301,100006,'514483431161',105,'PS5','2024-05-04 04:49:30','create','2024-05-04 12:49:30','2024-05-04 12:49:30'),
    (134,'zxy',100301,100006,'401352928023',104,'温馨台灯','2024-05-04 04:49:42','create','2024-05-04 12:49:42','2024-05-04 12:49:42'),
    (135,'zxy',100301,100006,'569764837195',104,'温馨台灯','2024-05-04 04:50:36','create','2024-05-04 12:50:35','2024-05-04 12:50:35'),
    (136,'zxy',100301,100006,'653239020479',104,'温馨台灯','2024-05-04 04:50:44','create','2024-05-04 12:50:44','2024-05-04 12:50:44'),
    (137,'zxy',100301,100006,'407172497549',107,'华为耳机','2024-05-04 07:29:28','create','2024-05-04 15:29:28','2024-05-04 15:29:28'),
    (138,'zxy',100301,100006,'799188603085',106,'轻奢办公椅','2024-05-04 07:29:36','create','2024-05-04 15:29:35','2024-05-04 15:29:35'),
    (139,'zxy',100301,100006,'528987104958',107,'华为耳机','2024-05-04 07:29:43','create','2024-05-04 15:29:42','2024-05-04 15:29:42'),
    (140,'zxy',100301,100006,'966648280772',106,'轻奢办公椅','2024-05-04 07:29:50','create','2024-05-04 15:29:49','2024-05-04 15:29:49'),
    (141,'zxy',100301,100006,'087190703146',107,'华为耳机','2024-05-04 07:29:56','create','2024-05-04 15:29:56','2024-05-04 15:29:56'),
    (142,'liergou',100301,100006,'844440368058',101,'随机积分','2024-05-04 07:30:36','create','2024-05-04 15:30:36','2024-05-04 15:30:36'),
    (143,'liergou',100301,100006,'390787212758',104,'温馨台灯','2024-05-04 07:31:17','create','2024-05-04 15:31:17','2024-05-04 15:31:17'),
    (144,'liergou',100301,100006,'640363472357',103,'算法书籍','2024-05-04 07:31:24','create','2024-05-04 15:31:24','2024-05-04 15:31:24'),
    (145,'liergou',100301,100006,'974075965572',108,'温馨玩偶','2024-05-04 07:31:31','create','2024-05-04 15:31:31','2024-05-04 15:31:31'),
    (146,'liergou',100301,100006,'682189502378',106,'轻奢办公椅','2024-05-04 07:31:38','create','2024-05-04 15:31:38','2024-05-04 15:31:38'),
    (147,'liergou',100301,100006,'267171522488',104,'温馨台灯','2024-05-04 07:31:45','create','2024-05-04 15:31:45','2024-05-04 15:31:45'),
    (148,'liergou',100301,100006,'840617006609',107,'华为耳机','2024-05-04 07:31:52','create','2024-05-04 15:31:51','2024-05-04 15:31:51'),
    (149,'liergou',100301,100006,'412882808007',103,'算法书籍','2024-05-04 07:32:00','create','2024-05-04 15:31:59','2024-05-04 15:31:59'),
    (150,'liergou',100301,100006,'909193532035',101,'随机积分','2024-05-04 07:32:07','create','2024-05-04 15:32:06','2024-05-04 15:32:06'),
    (151,'liergou',100301,100006,'941421834903',103,'算法书籍','2024-05-04 07:32:13','create','2024-05-04 15:32:13','2024-05-04 15:32:13'),
    (152,'liergou',100301,100006,'502088692031',103,'算法书籍','2024-05-04 07:32:29','create','2024-05-04 15:32:29','2024-05-04 15:32:29'),
    (153,'liergou',100301,100006,'983938339728',103,'算法书籍','2024-05-04 07:32:36','create','2024-05-04 15:32:35','2024-05-04 15:32:35'),
    (154,'liergou',100301,100006,'300359343610',103,'算法书籍','2024-05-04 07:32:42','create','2024-05-04 15:32:42','2024-05-04 15:32:42'),
    (155,'liergou',100301,100006,'205701271412',102,'AI-Agent一周体验卡','2024-05-04 07:34:11','create','2024-05-04 15:34:10','2024-05-04 15:34:10'),
    (156,'zxy',100301,100006,'472964574229',106,'轻奢办公椅','2024-05-29 23:24:02','create','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (157,'zxy',100301,100006,'096000668706',107,'华为耳机','2024-05-29 23:24:02','create','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (158,'zxy',100301,100006,'053808941529',107,'华为耳机','2024-05-29 23:24:03','create','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (159,'zxy',100301,100006,'546003504055',106,'轻奢办公椅','2024-05-29 23:24:03','create','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (160,'zxy',100301,100006,'531425424850',107,'华为耳机','2024-05-29 23:24:03','create','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (161,'zxy',100301,100006,'101866910505',106,'轻奢办公椅','2024-06-09 08:38:08','create','2024-06-09 16:38:08','2024-06-09 16:38:08'),
    (162,'zxy',100301,100006,'982300492592',107,'华为耳机','2024-06-09 08:39:18','create','2024-06-09 16:39:18','2024-06-09 16:39:18'),
    (163,'zxy',100301,100006,'910742677700',107,'华为耳机','2024-06-09 08:40:27','create','2024-06-09 16:40:27','2024-06-09 16:40:27'),
    (164,'zxy',100301,100006,'491443986394',107,'华为耳机','2024-06-09 08:48:30','create','2024-06-09 16:48:30','2024-06-09 16:48:30'),
    (165,'zxy',100301,100006,'185144859882',107,'华为耳机','2024-06-09 08:51:52','create','2024-06-09 16:51:52','2024-06-09 16:51:52'),
    (166,'zxy',100301,100006,'824053366847',106,'轻奢办公椅','2024-06-09 08:54:52','create','2024-06-09 16:54:51','2024-06-09 16:54:51'),
    (167,'zxy',100301,100006,'261041879408',107,'华为耳机','2024-06-09 08:57:05','create','2024-06-09 16:57:04','2024-06-09 16:57:04'),
    (168,'zxy',100301,100006,'347687076714',107,'华为耳机','2024-06-09 09:50:04','create','2024-06-09 17:50:04','2024-06-09 17:50:04'),
    (169,'zxy',100301,100006,'686437761355',107,'华为耳机','2024-06-09 10:01:21','create','2024-06-09 18:01:21','2024-06-09 18:01:21'),
    (170,'zxy',100301,100006,'785085017376',103,'算法书籍','2024-06-09 10:44:44','create','2024-06-09 18:44:43','2024-06-09 18:44:43'),
    (171,'zxy',100301,100006,'621539805309',104,'温馨台灯','2024-06-10 00:16:56','create','2024-06-10 08:16:55','2024-06-10 08:16:55'),
    (172,'zxy',100301,100006,'409116465954',102,'AI-Agent一周体验卡','2024-06-10 01:32:01','create','2024-06-10 09:32:01','2024-06-10 09:32:01'),
    (173,'zxy',100301,100006,'425949139982',101,'随机积分','2024-06-10 01:32:02','completed','2024-06-10 09:32:01','2024-06-10 09:32:01'),
    (174,'zxy',100301,100006,'495003911464',104,'温馨台灯','2024-06-10 01:32:02','create','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (175,'zxy',100301,100006,'995078901219',102,'AI-Agent一周体验卡','2024-06-10 01:32:02','create','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (176,'zxy',100301,100006,'858859626738',103,'算法书籍','2024-06-10 01:32:02','create','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (177,'zxy',100301,100006,'053708718603',104,'温馨台灯','2024-06-10 01:32:03','create','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (178,'zxy',100301,100006,'297260334918',107,'华为耳机','2024-06-10 01:32:03','create','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (179,'zxy',100301,100006,'167963236057',103,'算法书籍','2024-06-10 01:32:03','create','2024-06-10 09:32:03','2024-06-10 09:32:03'),
    (180,'zxy',100301,100006,'653777558291',103,'算法书籍','2024-06-10 01:32:03','create','2024-06-10 09:32:03','2024-06-10 09:32:03'),
    (181,'zxy',100301,100006,'281047495461',102,'AI-Agent一周体验卡','2024-06-10 01:32:03','create','2024-06-10 09:32:03','2024-06-10 09:32:03'),
    (182,'zxy',100301,100006,'880920828501',103,'算法书籍','2024-06-10 01:33:43','create','2024-06-10 09:33:43','2024-06-10 09:33:43'),
    (183,'zxy',100301,100006,'082869528704',102,'AI-Agent一周体验卡','2024-06-10 01:35:31','create','2024-06-10 09:35:31','2024-06-10 09:35:31'),
    (184,'zxy',100301,100006,'775059128414',102,'AI-Agent一周体验卡','2024-06-10 01:36:24','create','2024-06-10 09:36:24','2024-06-10 09:36:24'),
    (185,'zxy',100301,100006,'156151328815',103,'算法书籍','2024-06-10 01:36:25','create','2024-06-10 09:36:24','2024-06-10 09:36:24'),
    (186,'zxy',100301,100006,'118558329771',103,'算法书籍','2024-06-10 01:36:25','create','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (187,'zxy',100301,100006,'427636834661',102,'AI-Agent一周体验卡','2024-06-10 01:36:25','create','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (188,'zxy',100301,100006,'135758549193',102,'AI-Agent一周体验卡','2024-06-10 01:36:25','create','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (189,'zxy',100301,100006,'596222110197',102,'AI-Agent一周体验卡','2024-06-10 01:36:26','create','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (190,'zxy',100301,100006,'133465033320',103,'算法书籍','2024-06-10 01:36:26','create','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (191,'zxy',100301,100006,'473872104570',102,'AI-Agent一周体验卡','2024-06-10 01:36:26','create','2024-06-10 09:36:26','2024-06-10 09:36:26'),
    (192,'zxy',100301,100006,'423248249261',103,'算法书籍','2024-06-10 01:36:26','create','2024-06-10 09:36:26','2024-06-10 09:36:26'),
    (193,'zxy',100301,100006,'308631038775',103,'算法书籍','2024-06-10 01:36:27','create','2024-06-10 09:36:26','2024-06-10 09:36:26'),
    (194,'zxy',100301,100006,'519396224936',102,'AI-Agent一周体验卡','2024-06-15 12:02:17','create','2024-06-15 20:02:17','2024-06-15 20:02:17'),
    (195,'zxy',100301,100006,'670420154694',103,'算法书籍','2024-06-15 12:19:36','create','2024-06-15 20:19:36','2024-06-15 20:19:36'),
    (196,'zxy',100301,100006,'698760826583',103,'算法书籍','2024-06-15 12:19:37','create','2024-06-15 20:19:36','2024-06-15 20:19:36');

/*!40000 ALTER TABLE `user_award_record_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_award_record_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_002`;

CREATE TABLE `user_award_record_002` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                         `award_id` int(11) NOT NULL COMMENT '奖品ID',
                                         `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
                                         `award_time` datetime NOT NULL COMMENT '中奖时间',
                                         `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id` (`user_id`),
                                         KEY `idx_activity_id` (`activity_id`),
                                         KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';

LOCK TABLES `user_award_record_002` WRITE;
/*!40000 ALTER TABLE `user_award_record_002` DISABLE KEYS */;

INSERT INTO `user_award_record_002` (`id`, `user_id`, `activity_id`, `strategy_id`, `order_id`, `award_id`, `award_title`, `award_time`, `award_state`, `create_time`, `update_time`)
VALUES
    (1,'liergou2',100301,100006,'319771078666',108,'温馨玩偶','2024-05-04 07:35:57','create','2024-05-04 15:35:56','2024-05-04 15:35:56'),
    (2,'liergou2',100301,100006,'953580004772',101,'随机积分','2024-05-04 07:36:03','create','2024-05-04 15:36:03','2024-05-04 15:36:03'),
    (3,'liergou2',100301,100006,'002033127656',103,'算法书籍','2024-05-04 07:36:10','create','2024-05-04 15:36:10','2024-05-04 15:36:10'),
    (4,'liergou2',100301,100006,'786106818681',101,'随机积分','2024-05-04 07:36:22','create','2024-05-04 15:36:22','2024-05-04 15:36:22'),
    (5,'liergou2',100301,100006,'903521978453',101,'随机积分','2024-05-04 07:36:33','create','2024-05-04 15:36:32','2024-05-04 15:36:32'),
    (6,'liergou2',100301,100006,'599563157264',104,'温馨台灯','2024-05-04 07:36:40','create','2024-05-04 15:36:39','2024-05-04 15:36:39'),
    (7,'liergou2',100301,100006,'236230739530',101,'随机积分','2024-05-04 07:36:47','create','2024-05-04 15:36:46','2024-05-04 15:36:46'),
    (8,'liergou2',100301,100006,'284065292342',101,'随机积分','2024-05-04 07:36:53','create','2024-05-04 15:36:53','2024-05-04 15:36:53'),
    (9,'liergou2',100301,100006,'667428166119',108,'温馨玩偶','2024-05-04 07:37:00','create','2024-05-04 15:36:59','2024-05-04 15:36:59'),
    (10,'liergou2',100301,100006,'320484285041',103,'算法书籍','2024-05-04 07:37:07','create','2024-05-04 15:37:06','2024-05-04 15:37:06'),
    (11,'liergou2',100301,100006,'048048925549',102,'AI-Agent一周体验卡','2024-05-04 07:37:13','create','2024-05-04 15:37:13','2024-05-04 15:37:13'),
    (12,'liergou2',100301,100006,'536732336372',103,'算法书籍','2024-05-04 07:37:21','create','2024-05-04 15:37:20','2024-05-04 15:37:20'),
    (13,'liergou2',100301,100006,'378120929272',102,'AI-Agent一周体验卡','2024-05-04 07:37:28','create','2024-05-04 15:37:28','2024-05-04 15:37:28'),
    (14,'liergou2',100301,100006,'368599869327',102,'AI-Agent一周体验卡','2024-05-04 07:37:38','create','2024-05-04 15:37:37','2024-05-04 15:37:37'),
    (15,'user003',100301,100006,'248641902208',101,'随机积分','2024-05-25 02:53:20','completed','2024-05-25 10:53:20','2024-05-25 10:53:20'),
    (16,'user003',100301,100006,'020196190863',101,'随机积分','2024-05-25 02:54:31','completed','2024-05-25 10:54:31','2024-05-25 10:54:31');

/*!40000 ALTER TABLE `user_award_record_002` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_award_record_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_003`;

CREATE TABLE `user_award_record_003` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                         `award_id` int(11) NOT NULL COMMENT '奖品ID',
                                         `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
                                         `award_time` datetime NOT NULL COMMENT '中奖时间',
                                         `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id` (`user_id`),
                                         KEY `idx_activity_id` (`activity_id`),
                                         KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';



# 转储表 user_behavior_rebate_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_behavior_rebate_order_000`;

CREATE TABLE `user_behavior_rebate_order_000` (
                                                  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                                  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                                  `behavior_type` varchar(16) NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                                  `rebate_desc` varchar(128) NOT NULL COMMENT '返利描述',
                                                  `rebate_type` varchar(16) NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                                  `rebate_config` varchar(32) NOT NULL COMMENT '返利配置【sku值，积分值】',
                                                  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
                                                  `biz_id` varchar(128) NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
                                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                  PRIMARY KEY (`id`),
                                                  UNIQUE KEY `uq_order_id` (`order_id`),
                                                  UNIQUE KEY `uq_biz_id` (`biz_id`),
                                                  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为返利流水订单表';



# 转储表 user_behavior_rebate_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_behavior_rebate_order_001`;

CREATE TABLE `user_behavior_rebate_order_001` (
                                                  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                                  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                                  `behavior_type` varchar(16) NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                                  `rebate_desc` varchar(128) NOT NULL COMMENT '返利描述',
                                                  `rebate_type` varchar(16) NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                                  `rebate_config` varchar(32) NOT NULL COMMENT '返利配置【sku值，积分值】',
                                                  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
                                                  `biz_id` varchar(128) NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
                                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                  PRIMARY KEY (`id`),
                                                  UNIQUE KEY `uq_order_id` (`order_id`),
                                                  UNIQUE KEY `uq_biz_id` (`biz_id`),
                                                  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为返利流水订单表';

LOCK TABLES `user_behavior_rebate_order_001` WRITE;
/*!40000 ALTER TABLE `user_behavior_rebate_order_001` DISABLE KEYS */;

INSERT INTO `user_behavior_rebate_order_001` (`id`, `user_id`, `order_id`, `behavior_type`, `rebate_desc`, `rebate_type`, `rebate_config`, `out_business_no`, `biz_id`, `create_time`, `update_time`)
VALUES
    (5,'zxy','630841674684','sign','签到返利-sku额度','sku','9011','20240503','zxy_sku_20240503','2024-05-03 13:28:42','2024-05-03 13:28:42'),
    (6,'zxy','552413408368','sign','签到返利-积分','integral','10','20240503','zxy_integral_20240503','2024-05-03 13:28:42','2024-05-03 13:28:42'),
    (33,'liergou','658660043956','sign','签到返利-sku额度','sku','9011','20240504','liergou_sku_20240504','2024-05-04 15:32:25','2024-05-04 15:32:25'),
    (34,'liergou','659440313972','sign','签到返利-积分','integral','10','20240504','liergou_integral_20240504','2024-05-04 15:32:25','2024-05-04 15:32:25'),
    (35,'zxy','577047817885','sign','签到返利-积分','integral','10','20240601001','zxy_integral_20240601001','2024-06-01 10:49:00','2024-06-01 10:49:00'),
    (37,'zxy','060366280132','sign','签到返利-积分','integral','10','20240601002','zxy_integral_20240601002','2024-06-01 10:51:58','2024-06-01 10:51:58'),
    (38,'zxy','735771087688','sign','签到返利-积分','integral','10','20240601003','zxy_integral_20240601003','2024-06-01 10:52:52','2024-06-01 10:52:52'),
    (39,'zxy','890916856671','sign','签到返利-积分','integral','10','20240601004','zxy_integral_20240601004','2024-06-01 10:54:30','2024-06-01 10:54:30'),
    (40,'zxy','881155696490','sign','签到返利-积分','integral','10','20240601005','zxy_integral_20240601005','2024-06-01 10:57:09','2024-06-01 10:57:09'),
    (41,'zxy','213871507610','sign','签到返利-积分','integral','10','20240601006','zxy_integral_20240601006','2024-06-01 11:00:27','2024-06-01 11:00:27'),
    (43,'zxy','031074415283','sign','签到返利-积分','integral','10','20240601101','zxy_integral_20240601101','2024-06-01 14:02:47','2024-06-01 14:02:47'),
    (44,'zxy','361978465199','sign','签到返利-积分','integral','10','20240621','zxy_integral_20240621','2024-06-21 21:50:08','2024-06-21 21:50:08'),
    (45,'zxy','494235657121','sign','签到返利-积分','integral','10','20240622','zxy_integral_20240622','2024-06-22 08:53:26','2024-06-22 08:53:26');

/*!40000 ALTER TABLE `user_behavior_rebate_order_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_behavior_rebate_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_behavior_rebate_order_002`;

CREATE TABLE `user_behavior_rebate_order_002` (
                                                  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                                  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                                  `behavior_type` varchar(16) NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                                  `rebate_desc` varchar(128) NOT NULL COMMENT '返利描述',
                                                  `rebate_type` varchar(16) NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                                  `rebate_config` varchar(32) NOT NULL COMMENT '返利配置【sku值，积分值】',
                                                  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
                                                  `biz_id` varchar(128) NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
                                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                  PRIMARY KEY (`id`),
                                                  UNIQUE KEY `uq_order_id` (`order_id`),
                                                  UNIQUE KEY `uq_biz_id` (`biz_id`),
                                                  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为返利流水订单表';

LOCK TABLES `user_behavior_rebate_order_002` WRITE;
/*!40000 ALTER TABLE `user_behavior_rebate_order_002` DISABLE KEYS */;

INSERT INTO `user_behavior_rebate_order_002` (`id`, `user_id`, `order_id`, `behavior_type`, `rebate_desc`, `rebate_type`, `rebate_config`, `out_business_no`, `biz_id`, `create_time`, `update_time`)
VALUES
    (5,'liergou2','274252392446','sign','签到返利-sku额度','sku','9011','20240504','liergou2_sku_20240504','2024-05-04 15:35:52','2024-05-04 15:35:52'),
    (6,'liergou2','687741770429','sign','签到返利-积分','integral','10','20240504','liergou2_integral_20240504','2024-05-04 15:35:52','2024-05-04 15:35:52'),
    (7,'user003','317965139211','sign','签到返利-sku额度','sku','9011','20240525','user003_sku_20240525','2024-05-25 10:52:18','2024-05-25 10:52:18'),
    (8,'user003','429627541291','sign','签到返利-积分','integral','10','20240525','user003_integral_20240525','2024-05-25 10:52:19','2024-05-25 10:52:19');

/*!40000 ALTER TABLE `user_behavior_rebate_order_002` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_behavior_rebate_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_behavior_rebate_order_003`;

CREATE TABLE `user_behavior_rebate_order_003` (
                                                  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                                  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                                  `behavior_type` varchar(16) NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                                  `rebate_desc` varchar(128) NOT NULL COMMENT '返利描述',
                                                  `rebate_type` varchar(16) NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                                  `rebate_config` varchar(32) NOT NULL COMMENT '返利配置【sku值，积分值】',
                                                  `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
                                                  `biz_id` varchar(128) NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
                                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                  PRIMARY KEY (`id`),
                                                  UNIQUE KEY `uq_order_id` (`order_id`),
                                                  UNIQUE KEY `uq_biz_id` (`biz_id`),
                                                  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户行为返利流水订单表';

LOCK TABLES `user_behavior_rebate_order_003` WRITE;
/*!40000 ALTER TABLE `user_behavior_rebate_order_003` DISABLE KEYS */;

INSERT INTO `user_behavior_rebate_order_003` (`id`, `user_id`, `order_id`, `behavior_type`, `rebate_desc`, `rebate_type`, `rebate_config`, `out_business_no`, `biz_id`, `create_time`, `update_time`)
VALUES
    (1,'zxy26','075434688710','sign','签到返利-sku额度','sku','9014','20240622','zxy26_sku_20240622','2024-06-22 10:22:35','2024-06-22 10:22:35'),
    (2,'zxy26','318331403679','sign','签到返利-积分','integral','10','20240622','zxy26_integral_20240622','2024-06-22 10:22:35','2024-06-22 10:22:35');

/*!40000 ALTER TABLE `user_behavior_rebate_order_003` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_credit_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_credit_account`;

CREATE TABLE `user_credit_account` (
                                       `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                       `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                       `total_amount` decimal(10,2) NOT NULL COMMENT '总积分，显示总账户值，记得一个人获得的总积分',
                                       `available_amount` decimal(10,2) NOT NULL COMMENT '可用积分，每次扣减的值',
                                       `account_status` varchar(8) NOT NULL COMMENT '账户状态【open - 可用，close - 冻结】',
                                       `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                       PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户积分账户';

LOCK TABLES `user_credit_account` WRITE;
/*!40000 ALTER TABLE `user_credit_account` DISABLE KEYS */;

INSERT INTO `user_credit_account` (`id`, `user_id`, `total_amount`, `available_amount`, `account_status`, `create_time`, `update_time`)
VALUES
    (1,'zxy',150.91,130.91,'open','2024-05-24 22:11:59','2024-06-22 11:11:02'),
    (2,'user003',0.96,0.96,'open','2024-05-25 10:53:20','2024-05-25 10:54:31'),
    (3,'zxy26',10.00,10.00,'open','2024-06-22 10:22:35','2024-06-22 10:22:35');

/*!40000 ALTER TABLE `user_credit_account` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_credit_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_credit_order_000`;

CREATE TABLE `user_credit_order_000` (
                                         `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `trade_name` varchar(32) NOT NULL COMMENT '交易名称',
                                         `trade_type` varchar(8) NOT NULL DEFAULT 'forward' COMMENT '交易类型；forward-正向、reverse-逆向',
                                         `trade_amount` decimal(10,2) NOT NULL COMMENT '交易金额',
                                         `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传。返利、行为等唯一标识',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                         KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户积分订单记录';



# 转储表 user_credit_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_credit_order_001`;

CREATE TABLE `user_credit_order_001` (
                                         `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `trade_name` varchar(32) NOT NULL COMMENT '交易名称',
                                         `trade_type` varchar(8) NOT NULL DEFAULT 'forward' COMMENT '交易类型；forward-正向、reverse-逆向',
                                         `trade_amount` decimal(10,2) NOT NULL COMMENT '交易金额',
                                         `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传。返利、行为等唯一标识',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                         KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户积分订单记录';

LOCK TABLES `user_credit_order_001` WRITE;
/*!40000 ALTER TABLE `user_credit_order_001` DISABLE KEYS */;

INSERT INTO `user_credit_order_001` (`id`, `user_id`, `order_id`, `trade_name`, `trade_type`, `trade_amount`, `out_business_no`, `create_time`, `update_time`)
VALUES
    (1,'zxy','950333991038','行为返利','forward',10.19,'10000990990','2024-06-01 10:31:16','2024-06-01 10:31:16'),
    (4,'zxy','957646101468','行为返利','forward',-10.19,'10000990991','2024-06-01 10:33:26','2024-06-01 10:33:26'),
    (5,'zxy','105601831431','行为返利','forward',10.00,'zxy_integral_20240601006','2024-06-01 11:00:45','2024-06-01 11:00:45'),
    (6,'zxy','120781019441','行为返利','forward',10.19,'100009900001','2024-06-01 13:57:22','2024-06-01 13:57:22'),
    (7,'zxy','626373070354','行为返利','reverse',-10.19,'100009900002','2024-06-01 13:58:23','2024-06-01 13:58:23'),
    (8,'zxy','726664203611','行为返利','forward',10.00,'zxy_integral_20240601101','2024-06-01 14:02:48','2024-06-01 14:02:48'),
    (9,'zxy','337035866234','行为返利','forward',10.19,'100009909911','2024-06-01 14:27:20','2024-06-01 14:27:20'),
    (11,'zxy','904262714981','行为返利','forward',10.19,'12406039900002','2024-06-03 07:28:02','2024-06-03 07:28:02'),
    (12,'zxy','313070417337','兑换抽奖','reverse',-1.68,'70009240608003','2024-06-08 20:27:03','2024-06-08 20:27:03'),
    (15,'zxy','956437348272','兑换抽奖','reverse',-1.68,'70009240608007','2024-06-08 20:34:13','2024-06-08 20:34:13'),
    (16,'zxy','825697847616','兑换抽奖','reverse',-1.68,'70009240609001','2024-06-09 09:11:23','2024-06-09 09:11:23'),
    (17,'zxy','528225981137','兑换抽奖','reverse',-1.68,'70009240610002','2024-06-09 10:45:11','2024-06-09 10:45:11'),
    (18,'zxy','564697903775','兑换抽奖','reverse',1.68,'930967287605','2024-06-15 11:20:31','2024-06-15 11:20:31'),
    (19,'zxy','628209301378','兑换抽奖','reverse',1.68,'737554528904','2024-06-15 14:46:29','2024-06-15 14:46:29'),
    (20,'zxy','783120384577','行为返利','forward',10.00,'zxy_integral_20240621','2024-06-21 21:50:08','2024-06-21 21:50:08'),
    (21,'zxy','629518620287','行为返利','forward',10.00,'zxy_integral_20240622','2024-06-22 08:53:30','2024-06-22 08:53:30'),
    (22,'zxy','569328797999','兑换抽奖','reverse',-1.00,'581102699959','2024-06-22 09:31:16','2024-06-22 09:31:16'),
    (23,'zxy','181899571891','兑换抽奖','reverse',-1.00,'558549576217','2024-06-22 09:45:46','2024-06-22 09:45:46'),
    (24,'zxy','887819413964','兑换抽奖','reverse',-1.00,'512408648536','2024-06-22 09:45:52','2024-06-22 09:45:52'),
    (25,'zxy','876139557832','兑换抽奖','reverse',-1.00,'954851009052','2024-06-22 09:45:54','2024-06-22 09:45:54'),
    (26,'zxy','369045346137','兑换抽奖','reverse',-1.00,'156304594063','2024-06-22 09:45:58','2024-06-22 09:45:58'),
    (27,'zxy','896456690441','兑换抽奖','reverse',-5.00,'844410851560','2024-06-22 09:49:28','2024-06-22 09:49:28'),
    (28,'zxy','781364485025','兑换抽奖','reverse',-5.00,'450478498484','2024-06-22 09:49:31','2024-06-22 09:49:31'),
    (29,'zxy','169352244168','兑换抽奖','reverse',-5.00,'489789224063','2024-06-22 11:11:02','2024-06-22 11:11:02');

/*!40000 ALTER TABLE `user_credit_order_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_credit_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_credit_order_002`;

CREATE TABLE `user_credit_order_002` (
                                         `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `trade_name` varchar(32) NOT NULL COMMENT '交易名称',
                                         `trade_type` varchar(8) NOT NULL DEFAULT 'forward' COMMENT '交易类型；forward-正向、reverse-逆向',
                                         `trade_amount` decimal(10,2) NOT NULL COMMENT '交易金额',
                                         `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传。返利、行为等唯一标识',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                         KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户积分订单记录';



# 转储表 user_credit_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_credit_order_003`;

CREATE TABLE `user_credit_order_003` (
                                         `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `trade_name` varchar(32) NOT NULL COMMENT '交易名称',
                                         `trade_type` varchar(8) NOT NULL DEFAULT 'forward' COMMENT '交易类型；forward-正向、reverse-逆向',
                                         `trade_amount` decimal(10,2) NOT NULL COMMENT '交易金额',
                                         `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传。返利、行为等唯一标识',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                         KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户积分订单记录';

LOCK TABLES `user_credit_order_003` WRITE;
/*!40000 ALTER TABLE `user_credit_order_003` DISABLE KEYS */;

INSERT INTO `user_credit_order_003` (`id`, `user_id`, `order_id`, `trade_name`, `trade_type`, `trade_amount`, `out_business_no`, `create_time`, `update_time`)
VALUES
    (1,'zxy26','633312779415','行为返利','forward',10.00,'zxy26_integral_20240622','2024-06-22 10:22:35','2024-06-22 10:22:35');

/*!40000 ALTER TABLE `user_credit_order_003` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_raffle_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_000`;

CREATE TABLE `user_raffle_order_000` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `order_time` datetime NOT NULL COMMENT '下单时间',
                                         `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';



# 转储表 user_raffle_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_001`;

CREATE TABLE `user_raffle_order_001` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `order_time` datetime NOT NULL COMMENT '下单时间',
                                         `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';

LOCK TABLES `user_raffle_order_001` WRITE;
/*!40000 ALTER TABLE `user_raffle_order_001` DISABLE KEYS */;

INSERT INTO `user_raffle_order_001` (`id`, `user_id`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `order_state`, `create_time`, `update_time`)
VALUES
    (5,'zxy',100301,'测试活动',100006,'569856975978','2024-04-08 14:52:47','used','2024-04-08 22:52:47','2024-04-13 11:44:01'),
    (6,'zxy',100301,'测试活动',100006,'867136698684','2024-04-13 03:44:07','used','2024-04-13 11:44:10','2024-04-13 11:44:10'),
    (7,'zxy',100301,'测试活动',100006,'250425115608','2024-04-13 03:44:14','used','2024-04-13 11:44:14','2024-04-13 11:44:14'),
    (8,'zxy',100301,'测试活动',100006,'663910993767','2024-04-13 03:44:16','used','2024-04-13 11:44:15','2024-04-13 11:44:15'),
    (9,'zxy',100301,'测试活动',100006,'218374542905','2024-04-13 03:44:17','used','2024-04-13 11:44:16','2024-04-13 11:44:16'),
    (10,'zxy',100301,'测试活动',100006,'225714694474','2024-04-13 03:44:18','used','2024-04-13 11:44:17','2024-04-13 11:44:17'),
    (11,'zxy',100301,'测试活动',100006,'431167372778','2024-04-13 03:44:19','used','2024-04-13 11:44:18','2024-04-13 11:44:18'),
    (12,'zxy',100301,'测试活动',100006,'434079846497','2024-04-13 03:45:30','used','2024-04-13 11:45:29','2024-04-13 11:45:29'),
    (13,'zxy',100301,'测试活动',100006,'965685676429','2024-04-13 03:45:31','used','2024-04-13 11:45:30','2024-04-13 11:45:30'),
    (14,'zxy',100301,'测试活动',100006,'940273728363','2024-04-13 04:14:53','used','2024-04-13 12:14:53','2024-04-13 12:14:53'),
    (15,'zxy',100301,'测试活动',100006,'240699246294','2024-04-13 04:16:20','used','2024-04-13 12:16:19','2024-04-13 12:17:33'),
    (16,'zxy',100301,'测试活动',100006,'298101180210','2024-04-13 04:18:05','used','2024-04-13 12:18:05','2024-04-13 12:18:16'),
    (17,'zxy',100301,'测试活动',100006,'565655944488','2024-04-13 04:18:23','used','2024-04-13 12:18:23','2024-04-13 12:18:23'),
    (18,'zxy',100301,'测试活动',100006,'090289257534','2024-04-13 04:18:25','used','2024-04-13 12:18:24','2024-04-13 12:18:24'),
    (19,'zxy',100301,'测试活动',100006,'668356046426','2024-04-13 04:18:26','used','2024-04-13 12:18:25','2024-04-13 12:18:25'),
    (20,'zxy',100301,'测试活动',100006,'745680068300','2024-04-13 04:18:27','used','2024-04-13 12:18:26','2024-04-13 12:18:36'),
    (21,'zxy',100301,'测试活动',100006,'285300597983','2024-04-13 04:20:07','used','2024-04-13 12:20:07','2024-04-13 12:20:07'),
    (22,'zxy',100301,'测试活动',100006,'999361306023','2024-04-13 04:20:10','used','2024-04-13 12:20:09','2024-04-13 12:20:09'),
    (23,'zxy',100301,'测试活动',100006,'063682699381','2024-04-13 04:20:14','used','2024-04-13 12:20:13','2024-04-13 12:20:13'),
    (24,'zxy',100301,'测试活动',100006,'680488311338','2024-04-13 04:20:15','used','2024-04-13 12:20:14','2024-04-13 12:20:14'),
    (25,'zxy',100301,'测试活动',100006,'399058527457','2024-04-13 04:20:16','used','2024-04-13 12:20:16','2024-04-13 12:20:16'),
    (26,'zxy',100301,'测试活动',100006,'579122416749','2024-04-13 04:20:17','used','2024-04-13 12:20:17','2024-04-13 12:20:20'),
    (27,'zxy',100301,'测试活动',100006,'854484054432','2024-04-13 06:03:59','used','2024-04-13 14:03:59','2024-04-13 14:03:59'),
    (28,'zxy',100301,'测试活动',100006,'066823147917','2024-04-13 07:24:59','used','2024-04-13 15:25:05','2024-04-13 15:25:06'),
    (29,'zxy',100301,'测试活动',100006,'022620846137','2024-04-13 07:25:11','used','2024-04-13 15:25:11','2024-04-13 15:25:11'),
    (30,'zxy',100301,'测试活动',100006,'605666354632','2024-04-13 07:25:12','used','2024-04-13 15:25:12','2024-04-13 15:25:12'),
    (31,'zxy',100301,'测试活动',100006,'604661560037','2024-04-13 07:25:13','used','2024-04-13 15:25:13','2024-04-13 15:25:21'),
    (32,'zxy',100301,'测试活动',100006,'212448652580','2024-04-20 04:09:30','used','2024-04-20 12:09:30','2024-04-20 12:09:30'),
    (33,'zxy',100301,'测试活动',100006,'356729331179','2024-04-20 04:11:24','used','2024-04-20 12:11:24','2024-04-20 12:11:24'),
    (34,'zxy',100301,'测试活动',100006,'102669494145','2024-04-20 07:10:44','used','2024-04-20 15:10:44','2024-04-20 15:10:58'),
    (35,'zxy',100301,'测试活动',100006,'730186113832','2024-04-20 07:43:12','used','2024-04-20 15:43:12','2024-04-20 15:43:13'),
    (36,'zxy',100301,'测试活动',100006,'472281891603','2024-04-20 08:50:37','used','2024-04-20 16:50:38','2024-04-20 16:50:39'),
    (37,'zxy',100301,'测试活动',100006,'931181504757','2024-04-27 05:19:26','used','2024-04-27 13:19:26','2024-04-27 13:19:38'),
    (38,'zxy',100301,'测试活动',100006,'664993621684','2024-04-27 05:26:49','used','2024-04-27 13:26:49','2024-04-27 13:27:17'),
    (39,'zxy',100301,'测试活动',100006,'757674779249','2024-04-27 05:27:45','used','2024-04-27 13:27:45','2024-04-27 13:27:45'),
    (40,'zxy',100301,'测试活动',100006,'623885952534','2024-04-27 05:28:02','used','2024-04-27 13:28:01','2024-04-27 13:28:01'),
    (41,'zxy',100301,'测试活动',100006,'351875766756','2024-04-27 05:29:05','used','2024-04-27 13:29:05','2024-04-27 13:29:05'),
    (42,'zxy',100301,'测试活动',100006,'803227763198','2024-04-27 05:29:32','used','2024-04-27 13:29:31','2024-04-27 13:29:31'),
    (43,'zxy',100301,'测试活动',100006,'587527322073','2024-04-27 05:29:57','used','2024-04-27 13:29:57','2024-04-27 13:29:57'),
    (44,'zxy',100301,'测试活动',100006,'552928609772','2024-04-27 05:30:11','used','2024-04-27 13:30:11','2024-04-27 13:30:11'),
    (45,'zxy',100301,'测试活动',100006,'407462568156','2024-04-27 05:36:27','used','2024-04-27 13:36:27','2024-04-27 13:36:27'),
    (46,'zxy',100301,'测试活动',100006,'688519386935','2024-04-27 05:38:00','used','2024-04-27 13:38:00','2024-04-27 13:38:00'),
    (47,'zxy',100301,'测试活动',100006,'148984382545','2024-04-27 05:38:56','used','2024-04-27 13:38:55','2024-04-27 13:38:55'),
    (48,'zxy',100301,'测试活动',100006,'410701479648','2024-04-27 05:39:18','used','2024-04-27 13:39:18','2024-04-27 13:39:18'),
    (49,'zxy',100301,'测试活动',100006,'521226371540','2024-04-27 06:59:56','used','2024-04-27 14:59:56','2024-04-27 14:59:56'),
    (50,'zxy',100301,'测试活动',100006,'167000751553','2024-04-27 07:00:14','used','2024-04-27 15:00:14','2024-04-27 15:00:14'),
    (51,'zxy',100301,'测试活动',100006,'685179511666','2024-04-27 07:00:23','used','2024-04-27 15:00:22','2024-04-27 15:00:22'),
    (52,'zxy',100301,'测试活动',100006,'308424817839','2024-05-01 06:33:42','used','2024-05-01 14:33:43','2024-05-01 14:57:39'),
    (53,'zxy',100301,'测试活动',100006,'116865823300','2024-05-01 06:58:08','used','2024-05-01 14:58:08','2024-05-01 14:58:08'),
    (54,'zxy',100301,'测试活动',100006,'272157347851','2024-05-01 06:59:32','used','2024-05-01 14:59:32','2024-05-01 14:59:33'),
    (55,'zxy',100301,'测试活动',100006,'400772556300','2024-05-01 06:59:33','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (56,'zxy',100301,'测试活动',100006,'494705137752','2024-05-01 06:59:33','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (57,'zxy',100301,'测试活动',100006,'728609897262','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (58,'zxy',100301,'测试活动',100006,'085750418120','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (59,'zxy',100301,'测试活动',100006,'884615410376','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (60,'zxy',100301,'测试活动',100006,'380693771158','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (61,'zxy',100301,'测试活动',100006,'801793933954','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (62,'zxy',100301,'测试活动',100006,'153569048026','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (63,'zxy',100301,'测试活动',100006,'239541957386','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:33'),
    (64,'zxy',100301,'测试活动',100006,'417247136950','2024-05-01 06:59:34','used','2024-05-01 14:59:33','2024-05-01 14:59:34'),
    (65,'zxy',100301,'测试活动',100006,'556248667355','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (66,'zxy',100301,'测试活动',100006,'828955445464','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (67,'zxy',100301,'测试活动',100006,'756110942449','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (68,'zxy',100301,'测试活动',100006,'440069371435','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (69,'zxy',100301,'测试活动',100006,'421594084633','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (70,'zxy',100301,'测试活动',100006,'500905040429','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (71,'zxy',100301,'测试活动',100006,'712386571628','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (72,'zxy',100301,'测试活动',100006,'095923542021','2024-05-01 06:59:34','used','2024-05-01 14:59:34','2024-05-01 14:59:34'),
    (73,'zxy',100301,'测试活动',100006,'306233708878','2024-05-03 01:00:27','used','2024-05-03 09:00:28','2024-05-03 09:02:17'),
    (74,'zxy',100301,'测试活动',100006,'690124733440','2024-05-03 01:09:42','used','2024-05-03 09:09:42','2024-05-03 09:09:57'),
    (75,'zxy',100301,'测试活动',100006,'190487161872','2024-05-03 01:10:28','used','2024-05-03 09:10:28','2024-05-03 09:10:35'),
    (76,'zxy',100301,'测试活动',100006,'693117324295','2024-05-03 01:11:32','used','2024-05-03 09:11:32','2024-05-03 09:11:38'),
    (77,'zxy',100301,'测试活动',100006,'216557006872','2024-05-04 01:32:02','used','2024-05-04 09:32:02','2024-05-04 09:32:10'),
    (78,'zxy',100301,'测试活动',100006,'769208157430','2024-05-04 01:42:11','used','2024-05-04 09:42:11','2024-05-04 09:42:11'),
    (79,'zxy',100301,'测试活动',100006,'122549611053','2024-05-04 02:06:40','used','2024-05-04 10:06:40','2024-05-04 10:06:40'),
    (80,'zxy',100301,'测试活动',100006,'098077770962','2024-05-04 02:07:37','used','2024-05-04 10:07:36','2024-05-04 10:07:36'),
    (81,'zxy',100301,'测试活动',100006,'783440464441','2024-05-04 02:07:45','used','2024-05-04 10:07:44','2024-05-04 10:07:44'),
    (82,'zxy',100301,'测试活动',100006,'311741760661','2024-05-04 02:15:21','used','2024-05-04 10:15:21','2024-05-04 10:15:21'),
    (83,'zxy',100301,'测试活动',100006,'882852499238','2024-05-04 02:15:29','used','2024-05-04 10:15:29','2024-05-04 10:15:29'),
    (84,'zxy',100301,'测试活动',100006,'815259576049','2024-05-04 02:16:51','used','2024-05-04 10:16:51','2024-05-04 10:16:51'),
    (85,'zxy',100301,'测试活动',100006,'398933081979','2024-05-04 02:17:20','used','2024-05-04 10:17:19','2024-05-04 10:17:19'),
    (86,'zxy',100301,'测试活动',100006,'724477812186','2024-05-04 02:18:09','used','2024-05-04 10:18:09','2024-05-04 10:18:09'),
    (87,'zxy',100301,'测试活动',100006,'963415104251','2024-05-04 02:20:46','used','2024-05-04 10:20:46','2024-05-04 10:20:46'),
    (88,'zxy',100301,'测试活动',100006,'406832687477','2024-05-04 02:20:54','used','2024-05-04 10:20:54','2024-05-04 10:20:54'),
    (89,'zxy',100301,'测试活动',100006,'683420026858','2024-05-04 02:36:33','used','2024-05-04 10:36:32','2024-05-04 10:36:32'),
    (90,'zxy',100301,'测试活动',100006,'022379743786','2024-05-04 02:37:25','used','2024-05-04 10:37:25','2024-05-04 10:37:25'),
    (91,'zxy',100301,'测试活动',100006,'005727284053','2024-05-04 02:37:32','used','2024-05-04 10:37:32','2024-05-04 10:37:32'),
    (92,'zxy',100301,'测试活动',100006,'157097996505','2024-05-04 02:37:40','used','2024-05-04 10:37:39','2024-05-04 10:37:39'),
    (93,'zxy',100301,'测试活动',100006,'286115274205','2024-05-04 02:38:41','used','2024-05-04 10:38:41','2024-05-04 10:38:41'),
    (94,'zxy',100301,'测试活动',100006,'714442509117','2024-05-04 02:38:49','used','2024-05-04 10:38:49','2024-05-04 10:38:49'),
    (95,'zxy',100301,'测试活动',100006,'124268508437','2024-05-04 03:30:47','used','2024-05-04 11:30:47','2024-05-04 11:30:47'),
    (96,'zxy',100301,'测试活动',100006,'024028065395','2024-05-04 03:40:10','used','2024-05-04 11:40:09','2024-05-04 11:40:09'),
    (97,'zxy',100301,'测试活动',100006,'011132554981','2024-05-04 03:40:17','used','2024-05-04 11:40:16','2024-05-04 11:40:17'),
    (98,'zxy',100301,'测试活动',100006,'748409799526','2024-05-04 04:49:12','used','2024-05-04 12:49:11','2024-05-04 12:49:20'),
    (99,'zxy',100301,'测试活动',100006,'514483431161','2024-05-04 04:49:30','used','2024-05-04 12:49:30','2024-05-04 12:49:30'),
    (100,'zxy',100301,'测试活动',100006,'401352928023','2024-05-04 04:49:42','used','2024-05-04 12:49:42','2024-05-04 12:49:42'),
    (101,'zxy',100301,'测试活动',100006,'569764837195','2024-05-04 04:50:36','used','2024-05-04 12:50:35','2024-05-04 12:50:35'),
    (102,'zxy',100301,'测试活动',100006,'653239020479','2024-05-04 04:50:44','used','2024-05-04 12:50:44','2024-05-04 12:50:44'),
    (103,'zxy',100301,'测试活动',100006,'407172497549','2024-05-04 07:29:28','used','2024-05-04 15:29:28','2024-05-04 15:29:28'),
    (104,'zxy',100301,'测试活动',100006,'799188603085','2024-05-04 07:29:36','used','2024-05-04 15:29:35','2024-05-04 15:29:35'),
    (105,'zxy',100301,'测试活动',100006,'528987104958','2024-05-04 07:29:43','used','2024-05-04 15:29:42','2024-05-04 15:29:43'),
    (106,'zxy',100301,'测试活动',100006,'966648280772','2024-05-04 07:29:50','used','2024-05-04 15:29:49','2024-05-04 15:29:49'),
    (107,'zxy',100301,'测试活动',100006,'087190703146','2024-05-04 07:29:56','used','2024-05-04 15:29:56','2024-05-04 15:29:56'),
    (108,'liergou',100301,'测试活动',100006,'844440368058','2024-05-04 07:30:36','used','2024-05-04 15:30:36','2024-05-04 15:30:36'),
    (109,'liergou',100301,'测试活动',100006,'390787212758','2024-05-04 07:31:17','used','2024-05-04 15:31:17','2024-05-04 15:31:17'),
    (110,'liergou',100301,'测试活动',100006,'640363472357','2024-05-04 07:31:24','used','2024-05-04 15:31:24','2024-05-04 15:31:24'),
    (111,'liergou',100301,'测试活动',100006,'974075965572','2024-05-04 07:31:31','used','2024-05-04 15:31:31','2024-05-04 15:31:31'),
    (112,'liergou',100301,'测试活动',100006,'682189502378','2024-05-04 07:31:38','used','2024-05-04 15:31:38','2024-05-04 15:31:38'),
    (113,'liergou',100301,'测试活动',100006,'267171522488','2024-05-04 07:31:45','used','2024-05-04 15:31:44','2024-05-04 15:31:45'),
    (114,'liergou',100301,'测试活动',100006,'840617006609','2024-05-04 07:31:52','used','2024-05-04 15:31:51','2024-05-04 15:31:51'),
    (115,'liergou',100301,'测试活动',100006,'412882808007','2024-05-04 07:31:59','used','2024-05-04 15:31:59','2024-05-04 15:31:59'),
    (116,'liergou',100301,'测试活动',100006,'909193532035','2024-05-04 07:32:06','used','2024-05-04 15:32:06','2024-05-04 15:32:06'),
    (117,'liergou',100301,'测试活动',100006,'941421834903','2024-05-04 07:32:13','used','2024-05-04 15:32:13','2024-05-04 15:32:13'),
    (118,'liergou',100301,'测试活动',100006,'502088692031','2024-05-04 07:32:29','used','2024-05-04 15:32:29','2024-05-04 15:32:29'),
    (119,'liergou',100301,'测试活动',100006,'983938339728','2024-05-04 07:32:36','used','2024-05-04 15:32:35','2024-05-04 15:32:35'),
    (120,'liergou',100301,'测试活动',100006,'300359343610','2024-05-04 07:32:42','used','2024-05-04 15:32:42','2024-05-04 15:32:42'),
    (121,'liergou',100301,'测试活动',100006,'205701271412','2024-05-04 07:34:11','used','2024-05-04 15:34:10','2024-05-04 15:34:10'),
    (122,'zxy',100301,'测试活动',100006,'472964574229','2024-05-29 23:24:01','used','2024-05-30 07:24:01','2024-05-30 07:24:02'),
    (123,'zxy',100301,'测试活动',100006,'096000668706','2024-05-29 23:24:02','used','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (124,'zxy',100301,'测试活动',100006,'053808941529','2024-05-29 23:24:03','used','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (125,'zxy',100301,'测试活动',100006,'546003504055','2024-05-29 23:24:03','used','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (126,'zxy',100301,'测试活动',100006,'531425424850','2024-05-29 23:24:03','used','2024-05-30 07:24:02','2024-05-30 07:24:02'),
    (127,'zxy',100301,'测试活动',100006,'101866910505','2024-05-30 00:02:18','used','2024-05-30 08:02:18','2024-06-09 16:38:08'),
    (128,'zxy',100301,'测试活动',100006,'982300492592','2024-06-09 08:39:17','used','2024-06-09 16:39:17','2024-06-09 16:39:18'),
    (129,'zxy',100301,'测试活动',100006,'910742677700','2024-06-09 08:40:26','used','2024-06-09 16:40:26','2024-06-09 16:40:27'),
    (130,'zxy',100301,'测试活动',100006,'491443986394','2024-06-09 08:48:29','used','2024-06-09 16:48:29','2024-06-09 16:48:30'),
    (131,'zxy',100301,'测试活动',100006,'185144859882','2024-06-09 08:51:51','used','2024-06-09 16:51:51','2024-06-09 16:51:52'),
    (132,'zxy',100301,'测试活动',100006,'824053366847','2024-06-09 08:54:51','used','2024-06-09 16:54:51','2024-06-09 16:54:51'),
    (133,'zxy',100301,'测试活动',100006,'261041879408','2024-06-09 08:57:04','used','2024-06-09 16:57:04','2024-06-09 16:57:04'),
    (134,'zxy',100301,'测试活动',100006,'347687076714','2024-06-09 09:50:04','used','2024-06-09 17:50:04','2024-06-09 17:50:04'),
    (135,'zxy',100301,'测试活动',100006,'686437761355','2024-06-09 10:01:21','used','2024-06-09 18:01:20','2024-06-09 18:01:21'),
    (136,'zxy',100301,'测试活动',100006,'785085017376','2024-06-09 10:44:43','used','2024-06-09 18:44:43','2024-06-09 18:44:43'),
    (137,'zxy',100301,'测试活动',100006,'621539805309','2024-06-10 00:16:55','used','2024-06-10 08:16:55','2024-06-10 08:16:55'),
    (138,'zxy',100301,'测试活动',100006,'409116465954','2024-06-10 01:32:00','used','2024-06-10 09:32:00','2024-06-10 09:32:01'),
    (139,'zxy',100301,'测试活动',100006,'425949139982','2024-06-10 01:32:02','used','2024-06-10 09:32:01','2024-06-10 09:32:01'),
    (140,'zxy',100301,'测试活动',100006,'495003911464','2024-06-10 01:32:02','used','2024-06-10 09:32:01','2024-06-10 09:32:02'),
    (141,'zxy',100301,'测试活动',100006,'995078901219','2024-06-10 01:32:02','used','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (142,'zxy',100301,'测试活动',100006,'858859626738','2024-06-10 01:32:02','used','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (143,'zxy',100301,'测试活动',100006,'053708718603','2024-06-10 01:32:03','used','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (144,'zxy',100301,'测试活动',100006,'297260334918','2024-06-10 01:32:03','used','2024-06-10 09:32:02','2024-06-10 09:32:02'),
    (145,'zxy',100301,'测试活动',100006,'167963236057','2024-06-10 01:32:03','used','2024-06-10 09:32:02','2024-06-10 09:32:03'),
    (146,'zxy',100301,'测试活动',100006,'653777558291','2024-06-10 01:32:03','used','2024-06-10 09:32:03','2024-06-10 09:32:03'),
    (147,'zxy',100301,'测试活动',100006,'281047495461','2024-06-10 01:32:03','used','2024-06-10 09:32:03','2024-06-10 09:32:03'),
    (148,'zxy',100301,'测试活动',100006,'880920828501','2024-06-10 01:33:42','used','2024-06-10 09:33:43','2024-06-10 09:33:43'),
    (149,'zxy',100301,'测试活动',100006,'082869528704','2024-06-10 01:35:30','used','2024-06-10 09:35:30','2024-06-10 09:35:31'),
    (150,'zxy',100301,'测试活动',100006,'775059128414','2024-06-10 01:36:23','used','2024-06-10 09:36:23','2024-06-10 09:36:24'),
    (151,'zxy',100301,'测试活动',100006,'156151328815','2024-06-10 01:36:25','used','2024-06-10 09:36:24','2024-06-10 09:36:24'),
    (152,'zxy',100301,'测试活动',100006,'118558329771','2024-06-10 01:36:25','used','2024-06-10 09:36:24','2024-06-10 09:36:25'),
    (153,'zxy',100301,'测试活动',100006,'427636834661','2024-06-10 01:36:25','used','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (154,'zxy',100301,'测试活动',100006,'135758549193','2024-06-10 01:36:25','used','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (155,'zxy',100301,'测试活动',100006,'596222110197','2024-06-10 01:36:26','used','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (156,'zxy',100301,'测试活动',100006,'133465033320','2024-06-10 01:36:26','used','2024-06-10 09:36:25','2024-06-10 09:36:25'),
    (157,'zxy',100301,'测试活动',100006,'473872104570','2024-06-10 01:36:26','used','2024-06-10 09:36:26','2024-06-10 09:36:26'),
    (158,'zxy',100301,'测试活动',100006,'423248249261','2024-06-10 01:36:26','used','2024-06-10 09:36:26','2024-06-10 09:36:26'),
    (159,'zxy',100301,'测试活动',100006,'308631038775','2024-06-10 01:36:26','used','2024-06-10 09:36:26','2024-06-10 09:36:26'),
    (160,'zxy',100301,'测试活动',100006,'519396224936','2024-06-15 12:02:16','used','2024-06-15 20:02:16','2024-06-15 20:02:17'),
    (161,'zxy',100301,'测试活动',100006,'670420154694','2024-06-15 12:19:35','used','2024-06-15 20:19:35','2024-06-15 20:19:36'),
    (162,'zxy',100301,'测试活动',100006,'698760826583','2024-06-15 12:19:36','used','2024-06-15 20:19:36','2024-06-15 20:19:36');

/*!40000 ALTER TABLE `user_raffle_order_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_raffle_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_002`;

CREATE TABLE `user_raffle_order_002` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `order_time` datetime NOT NULL COMMENT '下单时间',
                                         `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';

LOCK TABLES `user_raffle_order_002` WRITE;
/*!40000 ALTER TABLE `user_raffle_order_002` DISABLE KEYS */;

INSERT INTO `user_raffle_order_002` (`id`, `user_id`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `order_state`, `create_time`, `update_time`)
VALUES
    (1,'liergou2',100301,'测试活动',100006,'319771078666','2024-05-04 07:35:56','used','2024-05-04 15:35:56','2024-05-04 15:35:56'),
    (2,'liergou2',100301,'测试活动',100006,'953580004772','2024-05-04 07:36:03','used','2024-05-04 15:36:03','2024-05-04 15:36:03'),
    (3,'liergou2',100301,'测试活动',100006,'002033127656','2024-05-04 07:36:10','used','2024-05-04 15:36:10','2024-05-04 15:36:10'),
    (4,'liergou2',100301,'测试活动',100006,'786106818681','2024-05-04 07:36:22','used','2024-05-04 15:36:21','2024-05-04 15:36:22'),
    (5,'liergou2',100301,'测试活动',100006,'903521978453','2024-05-04 07:36:33','used','2024-05-04 15:36:32','2024-05-04 15:36:32'),
    (6,'liergou2',100301,'测试活动',100006,'599563157264','2024-05-04 07:36:40','used','2024-05-04 15:36:39','2024-05-04 15:36:39'),
    (7,'liergou2',100301,'测试活动',100006,'236230739530','2024-05-04 07:36:47','used','2024-05-04 15:36:46','2024-05-04 15:36:46'),
    (8,'liergou2',100301,'测试活动',100006,'284065292342','2024-05-04 07:36:53','used','2024-05-04 15:36:53','2024-05-04 15:36:53'),
    (9,'liergou2',100301,'测试活动',100006,'667428166119','2024-05-04 07:37:00','used','2024-05-04 15:36:59','2024-05-04 15:36:59'),
    (10,'liergou2',100301,'测试活动',100006,'320484285041','2024-05-04 07:37:06','used','2024-05-04 15:37:06','2024-05-04 15:37:06'),
    (11,'liergou2',100301,'测试活动',100006,'048048925549','2024-05-04 07:37:13','used','2024-05-04 15:37:13','2024-05-04 15:37:13'),
    (12,'liergou2',100301,'测试活动',100006,'536732336372','2024-05-04 07:37:21','used','2024-05-04 15:37:20','2024-05-04 15:37:20'),
    (13,'liergou2',100301,'测试活动',100006,'378120929272','2024-05-04 07:37:28','used','2024-05-04 15:37:28','2024-05-04 15:37:28'),
    (14,'liergou2',100301,'测试活动',100006,'368599869327','2024-05-04 07:37:38','used','2024-05-04 15:37:37','2024-05-04 15:37:37'),
    (15,'user003',100301,'测试活动',100006,'248641902208','2024-05-25 02:53:19','used','2024-05-25 10:53:19','2024-05-25 10:53:20'),
    (16,'user003',100301,'测试活动',100006,'020196190863','2024-05-25 02:54:30','used','2024-05-25 10:54:30','2024-05-25 10:54:31');

/*!40000 ALTER TABLE `user_raffle_order_002` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_raffle_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_003`;

CREATE TABLE `user_raffle_order_003` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `order_time` datetime NOT NULL COMMENT '下单时间',
                                         `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
