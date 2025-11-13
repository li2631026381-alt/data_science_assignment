# 🌟 README.md

# 📘 用户行为分析与活跃度预测

### Data Science Assignment · 

---

## 📂 项目结构（Project Structure）

```
data_science_assignment/
│
├── analysis/
│   ├── part1_cleaning_exploration.ipynb   # Part1：数据清洗 + 探索性分析（EDA）
│   ├── part2_sql_queries.sql              # Part2：SQL 查询
│   └── part3_modeling.ipynb               # Part3：用户活跃度预测模型（优秀版）
│
├── data/
│   ├── users.csv                          # 用户表（原数据）
│   └── events.csv                         # 行为事件表（原数据）
│
├── README.md                              # 项目说明
└── report.md                               # 作业报告（总结）
```

---

# 📌 项目简介（Overview）

本项目基于两份用户行为数据（用户信息 + 事件日志），完成以下工作：

1. **数据清洗（Data Cleaning）**
2. **探索性数据分析（EDA）**
3. **SQL 查询练习（Part 2）**
4. **构建用户活跃度预测模型（可选）**

整体流程完整覆盖数据科学项目的主要步骤：
✔ 数据处理
✔ 数据探索
✔ 数据查询
✔ 特征工程
✔ 模型训练与解释

---

# 🧹 Part 1：数据清洗与探索性分析（EDA）

文件：`part1_cleaning_exploration.ipynb`

主要内容：

* 数据类型转换（时间格式处理）
* 缺失值检测与异常检查
* 年龄、性别等用户属性分布
* 事件类型统计、活跃趋势（DAU）
* 用户群体画像（性别/年龄 × 用户行为）

清洗后的数据可直接用于 SQL 和建模。

---

# 📊 Part 2：SQL 查询练习

文件：`part2_sql_queries.sql`

包含以下查询：

* 用户总数
* 按性别统计用户数量
* 按年龄段统计用户数量
* 总事件数
* 不同事件类型的数量
* 每日事件数（DAU）
* 用户行为的交叉分析（如：某事件类型各年龄段分布等）

---

# 🤖 Part 3：用户活跃度预测模型（Optional）

文件：`part3_modeling.ipynb`

步骤包括：

### ✔ 特征工程

构造用户层面的行为特征，如：

* 总行为次数 `event_count`
* 各事件类型次数（login / view_content / purchase 等）
* 距首次事件天数 `days_since_first_event`
* 是否发生购买行为 `has_purchase`

### ✔ 标签构造

将 `event_count > 10` 定义为活跃用户：

```
active_user = 1
非活跃用户 = 0
```

### ✔ 模型训练

使用随机森林（Random Forest）构建分类模型：

* 支持非线性关系
* 有强解释能力（feature importance）
* 易于调整和扩展

### ✔ 模型表现

模型能有效区分活跃 vs 非活跃用户；
特征重要性显示购买行为、浏览行为和登录频次是关键指标。

---

# 📑 报告（Report）

文件：`report.md`

内容包括：

* 数据概览
* 清洗过程总结
* EDA 关键发现
* SQL 查询结果
* 模型构建流程与结果
* 特征重要性分析
* 业务洞察与建议
* 后续优化方向

助教或评审可以直接阅读这份报告了解整个项目。

---

# 🛠️ 环境与依赖（Environment）

推荐使用以下工具：

* **Python 3.7+**
* Jupyter Notebook / VS Code
* 依赖包：

```bash
pip install pandas numpy matplotlib scikit-learn
```

---

# ▶️ 如何运行项目（Run Instructions）

1. 克隆仓库：

```bash
git clone <your-repo-url>
```

2. 安装依赖：

```bash
pip install -r requirements.txt   # 
```

3. 依次运行 Notebook：

```
analysis/
  ├── part1_cleaning_exploration.ipynb
  ├── part2_sql_queries.sql
  └── part3_modeling.ipynb
```

---

# 🎯 总结

该项目通过数据清洗、探索性分析、SQL 查询和机器学习模型，完整展示了一个用户行为分析的工作流。
最终模型能够较好识别活跃用户，为后续用户运营策略提供了基础支持。

如继续扩展，可尝试：

* 增加更多行为特征
* 采用 XGBoost / LightGBM
* 构建用户生命周期模型

