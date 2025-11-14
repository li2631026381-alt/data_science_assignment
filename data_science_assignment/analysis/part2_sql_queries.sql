-- ======================================
-- Part 2: SQL 查询练习
-- 表：users, events
-- ======================================

-- 1. 每天新注册用户数量（按 signup_date 分组）
SELECT 
    DATE(signup_date) AS signup_day,
    COUNT(*) AS new_users
FROM users
GROUP BY DATE(signup_date)
ORDER BY signup_day;


-- 2. 最近 7 天每天的活跃用户数
-- 定义：当天在 events 表中出现过的不同 user_id 数量
-- 注意：如果数据库不支持 DATE('now','-7 day')，可以改为手动填一个截止日期
SELECT 
    DATE(timestamp) AS event_date,
    COUNT(DISTINCT user_id) AS active_users
FROM events
WHERE DATE(timestamp) >= DATE('now', '-7 day')
GROUP BY DATE(timestamp)
ORDER BY event_date;


-- 3. 每个用户的事件总数
SELECT
    user_id,
    COUNT(*) AS total_events
FROM events
GROUP BY user_id
ORDER BY total_events DESC;


-- 4. 每个用户最常见的事件类型（最常发生的 event_type）
-- 如果数据库不支持窗口函数，可以视情况改写为子查询 + MAX(cnt)
WITH user_event_counts AS (
    SELECT 
        user_id,
        event_type,
        COUNT(*) AS cnt
    FROM events
    GROUP BY user_id, event_type
),
user_event_ranked AS (
    SELECT
        user_id,
        event_type,
        cnt,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY cnt DESC) AS rn
    FROM user_event_counts
)
SELECT
    user_id,
    event_type AS most_common_event,
    cnt AS event_count_for_this_type
FROM user_event_ranked
WHERE rn = 1
ORDER BY user_id;


-- 5. 男性与女性用户的平均事件数对比
-- 先统计每个用户的事件总数，再按性别求平均
WITH user_event_count AS (
    SELECT 
        user_id,
        COUNT(*) AS event_count
    FROM events
    GROUP BY user_id
)
SELECT 
    u.gender,
    AVG(e.event_count) AS avg_events_per_user
FROM users u
JOIN user_event_count e ON u.user_id = e.user_id
GROUP BY u.gender;


-- 6. 不同事件类型的整体分布
SELECT 
    event_type,
    COUNT(*) AS event_count
FROM events
GROUP BY event_type
ORDER BY event_count DESC;


-- 7. 每日事件总数（整体 DAU 趋势）
SELECT
    DATE(timestamp) AS event_date,
    COUNT(*) AS total_events
FROM events
GROUP BY DATE(timestamp)
ORDER BY event_date;
