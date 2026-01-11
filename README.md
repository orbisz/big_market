# 幸运营销汇 - 积分抽奖营销平台前端

<div align="center">

![Java](https://img.shields.io/badge/Java-8-orange)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-2.7.12-green)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue)
![Redis](https://img.shields.io/badge/Redis-6.2-red)
![RabbitMQ](https://img.shields.io/badge/RabbitMQ-3.12-orange)
![License](https://img.shields.io/badge/License-Apache%202.0-blue)

基于 DDD（领域驱动设计）的抽奖营销平台

[在线文档](#) · [快速开始](#快速开始) · [API 文档](#api-接口) · [常见问题](#常见问题)

</div>

---

## 项目介绍

Big Market 是一个基于 **DDD + 六边形架构** 设计的企业级抽奖营销平台。系统采用分库分表、缓存预热、异步消息等高性能技术方案，支持多种抽奖策略、活动管理、奖品分发、用户积分、行为返利等完整业务功能。

### 核心特性

- **DDD 架构设计** - 清晰的领域边界与六边形架构
- **分库分表** - 基于 userId 的自定义分片路由
- **高并发支持** - Redis 缓存 + 分布式锁 + 延迟队列
- **事件驱动** - RabbitMQ 异步解耦核心业务流程
- **策略模式** - 灵活可配置的抽奖策略与规则引擎
- **多活动类型** - 支持单抽、十连抽、积分兑换等多种玩法

---

## 系统架构

### 整体架构图

```
┌─────────────────────────────────────────────────────────────────────┐
│                         big_market-app                              │
│                      (Spring Boot 启动层)                           │
└─────────────────────────────────────────────────────────────────────┘
                                    │
        ┌───────────────────────────┼───────────────────────────┐
        ▼                           ▼                           ▼
┌───────────────┐           ┌───────────────┐           ┌───────────────┐
│   trigger     │           │    domain     │           │ infrastructure│
│  (驱动层)      │──────────→│   (领域层)     │←──────────│  (基础层)      │
├───────────────┤           ├───────────────┤           ├───────────────┤
│ • HTTP API    │           │ • 业务逻辑核心 │           │ • 数据持久化   │
│ • MQ 监听器    │           │ • 聚合根      │           │ • Redis 适配   │
│ • 定时任务     │           │ • 领域服务    │           │ • MQ 发布      │
└───────────────┘           └───────────────┘           └───────────────┘
        │                           │                           │
        └───────────────────────────┼───────────────────────────┘
                                    ▼
                          ┌───────────────┐
                          │     api       │
                          │  (端口层)      │
                          │ • 服务接口     │
                          │ • DTO 定义     │
                          └───────────────┘
                                    │
                          ┌───────────────┐
                          │    types      │
                          │  (共享类型层)  │
                          │ • 常量/枚举    │
                          │ • 异常/事件    │
                          └───────────────┘
```

### 领域模型

```
domain/
├── activity/      ──  活动域：活动配置、SKU管理、参与额度
├── strategy/      ──  策略域：抽奖算法、规则树、权重概率
├── award/         ──  奖品域：奖品分发、中奖记录
├── credit/        ──  积分域：积分账户、交易流水
├── rebate/        ──  返利域：行为返利（签到等）
└── task/          ──  任务域：后台任务管理
```

---

## 功能特性

| 功能模块 | 描述 |
|---------|------|
| 活动管理 | 支持创建多种类型的抽奖活动，配置活动时间、参与额度等 |
| SKU 商品 | 灵活配置活动商品，支持库存管理、额度限制 |
| 抽奖策略 | 权重概率算法、规则树引擎、解锁机制 |
| 单抽/十连抽 | 支持单次抽奖和十连抽，十连抽采用并行抽奖提升性能 |
| 积分系统 | 用户积分账户管理、积分兑换、交易记录 |
| 签到返利 | 日历签到返利，激励用户日常活跃 |
| 奖品分发 | 异步奖品分发，支持多种奖品类型 |
| 中奖记录 | 用户中奖记录查询，支持分页 |

---


## 项目结构

```
big_market
├── big_market-types          # 共享类型模块
│   ├── enums/                # 枚举定义
│   ├── exception/            # 异常定义
│   ├── event/                # 领域事件
│   └── model/                # 通用模型
│
├── big_market-api            # 端口层模块
│   ├── I*Service.java        # 服务接口定义
│   └── dto/                  # 请求/响应 DTO
│
├── big_market-domain         # 领域层模块
│   ├── activity/             # 活动领域
│   │   ├── model/            # 实体、聚合根、值对象
│   │   ├── service/          # 领域服务
│   │   └── repository/       # 仓储接口
│   ├── strategy/             # 策略领域
│   ├── award/                # 奖品领域
│   ├── credit/               # 积分领域
│   ├── rebate/               # 返利领域
│   └── task/                 # 任务领域
│
├── big_market-infrastructure # 基础层模块
│   ├── persistent/           # 持久化实现
│   │   ├── DAO/              # MyBatis DAO
│   │   ├── PO/               # 持久化对象
│   │   └── repository/       # 仓储实现
│   ├── cache/                # Redis 缓存
│   ├── event/                # 事件发布器
│   └── gateway/              # 外部网关
│
├── big_market-trigger        # 驱动层模块
│   ├── http/                 # HTTP 控制器
│   ├── listener/             # MQ 监听器
│   └── job/                  # 定时任务
│
├── big_market-app            # 启动模块
│   ├── src/main/java/
│   │   └── cn/bugstack/
│   │       └── Application.java
│   ├── src/main/resources/
│   │   ├── application.yml           # 主配置
│   │   ├── application-dev.yml       # 开发环境
│   │   ├── application-test.yml      # 测试环境
│   │   ├── application-prod.yml      # 生产环境
│   │   └── mybatis/                  # MyBatis 配置
│   └── Dockerfile                    # Docker 镜像
│
└── docs/                      # 文档目录
    └── dev-ops/                # 运维文档
        ├── docker-compose-environment.yml   # 基础设施
        ├── docker-compose-app.yml           # 应用部署
        └── mysql/sql/                       # 数据库脚本
```

---

## 快速开始

### 环境要求

- **JDK** 8+
- **Maven** 3.6+
- **MySQL** 8.0+
- **Redis** 6.0+
- **RabbitMQ** 3.12+

### 本地开发

#### 1. 克隆项目

```bash
git clone hhttps://github.com/orbisz/big_market.git
cd big_market
```

#### 2. 启动基础设施

使用 Docker Compose 快速启动 MySQL、Redis、RabbitMQ：

```bash
cd docs/dev-ops
docker-compose -f docker-compose-environment.yml up -d
```

#### 3. 初始化数据库

数据库脚本会在容器启动时自动执行。手动执行可参考：

```bash
# 连接 MySQL
mysql -h 127.0.0.1 -P 13306 -u root -p123456

# 执行初始化脚本
source docs/dev-ops/mysql/sql/big_market.sql
source docs/dev-ops/mysql/sql/big_market_01.sql
source docs/dev-ops/mysql/sql/big_market_02.sql
```

#### 4. 编译项目

```bash
# 编译整个项目
mvn clean install

# 跳过测试编译
mvn clean install -DskipTests
```

#### 5. 启动应用

```bash
cd big_market-app
mvn spring-boot:run
```

或直接运行编译后的 JAR：

```bash
java -jar big_market-app/target/big_market-app.jar
```

#### 6. 验证启动

访问健康检查接口：

```bash
curl "http://localhost:8091/api/v1/raffle/activity/armory?activityId=100301"
```

---

## Docker 快速部署

### 构建镜像

```bash
cd big_market-app

# 先编译打包
mvn clean package -DskipTests

# 构建 Docker 镜像
docker build --no-cache -t big-market-app:latest -f ./Dockerfile .
```

### 使用 Docker Compose 部署

```bash
cd docs/dev-ops

# 部署应用
docker-compose -f docker-compose-app.yml up -d

# 查看日志
docker-compose -f docker-compose-app.yml logs -f big-market-app
```

---

## API 接口

### 基础信息

- **Base URL**: `http://localhost:8091`
- **API 版本**: `v1`
- **Content-Type**: `application/json`

### 核心接口

| 接口 | 方法 | 路径 | 描述 |
|------|------|------|------|
| 活动装配 | GET | `/api/v1/raffle/activity/armory` | 数据预热 |
| 单次抽奖 | POST | `/api/v1/raffle/activity/draw` | 执行抽奖 |
| 十连抽 | POST | `/api/v1/raffle/activity/ten_draw` | 十连抽 |
| 查询账户额度 | POST | `/api/v1/raffle/activity/query_user_activity_account` | 用户额度 |
| 查询中奖记录 | POST | `/api/v1/raffle/activity/query_user_award_record_list` | 中奖记录 |
| 签到返利 | POST | `/api/v1/raffle/activity/calendar_sign_rebate` | 日历签到 |
| 查询奖品列表 | POST | `/api/v1/raffle/strategy/query_raffle_award_list` | 奖品配置 |

### 请求示例

#### 单次抽奖

```bash
curl --request POST \
  --url http://localhost:8091/api/v1/raffle/activity/draw \
  --header 'content-type: application/json' \
  --data '{
    "userId": "zxy",
    "activityId": 100301
  }'
```

**响应示例**：

```json
{
  "code": "0000",
  "info": "成功",
  "data": {
    "awardId": 101,
    "awardTitle": "积分兑换券",
    "awardIndex": 1
  }
}
```

#### 十连抽

```bash
curl --request POST \
  --url http://localhost:8091/api/v1/raffle/activity/ten_draw \
  --header 'content-type: application/json' \
  --data '{
    "userId": "zxy",
    "activityId": 100301
  }'
```

**响应示例**：

```json
{
  "code": "0000",
  "info": "成功",
  "data": {
    "drawResults": [
      {
        "orderId": "20240111001",
        "awardId": 101,
        "awardTitle": "积分兑换券",
        "awardIndex": 1
      },
      ...
    ]
  }
}
```

#### 签到返利

```bash
curl -X POST http://localhost:8091/api/v1/raffle/activity/calendar_sign_rebate \
  -d "userId=zxy" \
  -H "Content-Type: application/x-www-form-urlencoded"
```

---

## 使用场景

- **电商营销** - 大促活动抽奖、新品推广
- **用户增长** - 签到奖励、任务抽奖
- **会员运营** - 会员积分兑换、专属抽奖
- **游戏运营** - 游戏道具抽奖、每日抽奖

---

## 技术栈

| 技术 | 版本 | 用途 |
|------|------|------|
| Spring Boot | 2.7.12 | 应用框架 |
| MyBatis | 2.1.4 | ORM 框架 |
| MySQL | 8.0.22 | 数据库 |
| Redis | 6.2 (Redisson 3.23.4) | 缓存/分布式锁 |
| RabbitMQ | 3.12.9 | 消息队列 |
| HikariCP | - | 连接池 |
| db-router | 1.0.2 | 分库分表路由 |

---

## 常见问题

### Q1: 数据库连接失败？

检查 MySQL 服务是否正常启动，端口是否为 13306：

```bash
docker ps | grep mysql
mysql -h 127.0.0.1 -P 13306 -u root -p123456
```

### Q2: Redis 连接超时？

确认 Redis 端口配置正确（默认 16379）：

```bash
redis-cli -p 16379 ping
```

### Q3: 抽奖返回空结果？

需要先执行活动装配接口进行数据预热：

```bash
curl "http://localhost:8091/api/v1/raffle/activity/armory?activityId=100301"
```

### Q4: 十连抽失败？

检查用户账户额度是否足够（需要 10 次/日额度）：

```bash
curl --request POST \
  --url http://localhost:8091/api/v1/raffle/activity/query_user_activity_account \
  --header 'content-type: application/json' \
  --data '{"userId":"zxy","activityId":100301}'
```

---

## 重要文件索引

| 文件 | 说明 |
|------|------|
| [pom.xml](./pom.xml) | Maven 父工程配置 |
| [application.yml](./big_market-app/src/main/resources/application.yml) | 主配置文件 |
| [application-dev.yml](./big_market-app/src/main/resources/application-dev.yml) | 开发环境配置 |
| [docker-compose-environment.yml](./docs/dev-ops/docker-compose-environment.yml) | 基础设施部署 |
| [docker-compose-app.yml](./docs/dev-ops/docker-compose-app.yml) | 应用部署配置 |
| [Dockerfile](./big_market-app/Dockerfile) | 镜像构建配置 |

---

## 开发指南

### 添加新功能

1. **Domain 层** - 添加领域逻辑、实体、仓储接口
2. **Infrastructure 层** - 实现仓储、DAO、PO
3. **API 层** - 定义服务接口和 DTO
4. **Trigger 层** - 实现控制器或监听器
5. **Types 层** - 添加共享类型

### 设计模式

- **仓储模式** - 领域层定义接口，基础设施层实现
- **策略模式** - 可配置的抽奖策略
- **工厂模式** - 责任链工厂、决策树工厂
- **事件驱动** - 领域事件 + MQ 解耦

---

## 许可证

[Apache License 2.0](LICENSE)

---

## 联系方式

- 作者：orbisz
- 邮箱：431559981@qq.com
- 博客地址：https://orbisz.github.io/

---

<div align="center">

**如果这个项目对你有帮助，请给一个 Star**

Made with ❤️ by orbisz

</div>
