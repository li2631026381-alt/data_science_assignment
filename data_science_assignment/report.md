📘 数据科学课程作业报告（Report）
📌 项目名称：用户行为分析与活跃度预测
📅 日期：2025-11-13
👤 作者： 李彬雄
# 1. 引言（Introduction）

本项目基于某平台提供的两份用户行为数据集，分别为：

users.csv：记录用户基本信息（年龄、性别、注册日期等）

events.csv：记录用户在平台上的行为事件（如登录、点击、浏览、购买等）

项目任务目标包括：

对数据进行清洗、预处理

完成基础的探索性数据分析（EDA）

编写 SQL 查询以进一步探索数据

构建机器学习模型预测用户活跃度（选做）

本报告对整个分析与建模流程进行总结。

# 2. 数据集概览（Dataset Overview）
📂 2.1 用户表（users）

字段包括：

user_id

age

gender

signup_date

数据规模：约 100 条记录

年龄字段以数值形式存储，性别包含 Male / Female / Other 三类。

📂 2.2 事件表（events）

字段包括：

user_id

event_type（如 login, view_content, click_ad, purchase…）

timestamp

数据规模：约 2000 条事件记录

事件记录展示用户与平台的交互行为，为用户行为分析和构建活跃度指标提供了基础。

# 3. 数据清洗（Data Cleaning）

数据清洗在 part1_cleaning_exploration.ipynb 中完成，主要步骤包括：

✔ 1. 时间字段转换

将 signup_date 和 timestamp 转为 datetime 格式

确保后续可以进行日期差计算、按日分组统计等操作

✔ 2. 缺失值检查

users 表与 events 表的关键字段无缺失值

数据格式规范，适合直接用于 EDA 与建模

✔ 3. 异常字段检查

年龄字段范围合理（未出现负数或极端值）

性别字段为标准类别型取值

事件类别字段没有格式错误或乱码

清洗后数据集质量良好，可直接用于后续分析。

# 4. 探索性数据分析（EDA）
📊 4.1 用户年龄分布

年龄主要集中在 25 岁 — 45 岁区间

极少数用户年龄处于 18 岁以下或 60 岁以上

说明平台用户以成年、中青年用户为主，符合典型互联网产品用户画像。

📊 4.2 性别比例

男性与女性比例大致均衡

少量用户选择 Other（其他）

性别分布较为自然，没有明显偏斜。

📊 4.3 事件类型统计

最常见的事件类型包括：

view_content（浏览内容）

click_ad（点击广告）

login（登录）

purchase（购买）

其中 view_content 与 login 最为频繁，说明用户主要行为以登录和内容浏览为主，购买行为相对较少。

📊 4.4 DAU（日活跃用户）

基于每日事件数量统计：

平台在多数日期保持较平稳的事件活跃量

个别日期有峰值，可能与活动或推广有关

未发现明显异常数据

# 5. SQL 查询分析（Part 2）

在 part2_sql_queries.sql 中实现了以下 SQL：

✔ 查询总用户数
✔ 按性别统计用户数量
✔ 按年龄段统计用户数量
✔ 查询事件总数
✔ 各事件类型数量统计
✔ 按日期统计每日事件数量（DAU）

SQL 查询进一步验证了 EDA 中的发现，确保分析维度完整。

# 6. 用户活跃度预测模型（Part 3）

此部分为选做，但已完成，并实现了较完整的建模流程。

在 part3_modeling.ipynb 中完成以下步骤：

🧩 6.1 特征工程（Feature Engineering）

为每个用户构建：

event_count：总事件次数

各行为事件次数（如 login、logout、view_content、purchase…）

days_since_first_event：该用户与平台交互的“资历”

has_purchase：是否发生过购买行为（0/1）

这些特征能够反映用户行为深度，是判断活跃度的重要依据。

🏷️ 6.2 标签构造（Labeling）

由于数据集中没有直接的“活跃用户”标记，这里定义：

event_count > 10 → 活跃用户（active_user = 1）
event_count ≤ 10 → 非活跃用户（active_user = 0）

此定义在互联网业务中较为常见，符合用户贡献层级划分逻辑。

🧠 6.3 模型选择

使用 随机森林（Random Forest）：

能处理复杂非线性关系

支持特征重要性解释

不易过拟合，适合中小规模数据

📈 6.4 模型表现

通过 train_test_split 划分训练集与测试集后，使用分类报告（classification_report）评估模型。

整体来看：

模型可以较准确地区分活跃与非活跃用户

对活跃用户的召回率略低，说明进一步可以优化特征或阈值设定

⭐ 6.5 特征重要性（Feature Importance）

重要特征包括：

event_count（总事件数）

login / view_content 等事件次数

days_since_first_event

has_purchase

说明：

高频互动行为是活跃度的核心标志

注册更久的用户通常更可能成为活跃用户

有购买行为的用户活跃度明显更高（符合商业逻辑）

# 7. 结论与业务建议（Conclusion）

基于数据分析与模型构建，可以得出以下结论：

✔ 用户结构健康，年龄与性别分布自然
✔ 平台的主要行为是浏览与登录，购买行为偏少
✔ 活跃用户通常事件频次更高、浏览更频繁、注册更早
✔ 随机森林模型能较好预测用户是否活跃
# 8. 后续优化方向（Future Work）

若继续深入，可进一步实现：

使用更多时间序列特征（如 7 日内事件次数）

识别高潜用户以进行个性化推荐

区分不同事件权重进行更精细的活跃度评分

采用其他模型如 XGBoost 或 LightGBM 提升预测能力

📌 本报告所有分析对应代码存放于：

analysis/part1_cleaning_exploration.ipynb

analysis/part2_sql_queries.sql

analysis/part3_modeling.ipynb

报告到此结束。
