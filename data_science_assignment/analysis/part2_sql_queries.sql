-- =======================================
-- Part 2: SQL 查询练习
-- 数据表：users, events
-- =======================================

-- 1. 查询用户总数
SELECT COUNT(*) AS total_users
FROM users;

-- 2. 查询按性别统计的用户数量
SELECT gender, COUNT(*) AS count
FROM users
GROUP BY gender
ORDER BY count DESC;

-- 3. 查询年龄分布：统计不同年龄段的用户数量
SELECT
  CASE 
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    ELSE '46+'
  END AS age_group,
  COUNT(*) AS count
FROM users
GROUP BY age_group
ORDER BY count DESC;

-- 4. 查询事件总数（events 表）
SELECT COUNT(*) AS total_events
FROM events;

-- 5. 查询不同事件类型的数量
SELECT event_type, COUNT(*) AS count
FROM events
GROUP BY event_type
ORDER BY count DESC;

-- 6. 按日期统计每日事件数量（DAU）
SELECT 
  DATE(timestamp) AS event_date,
  COUNT(*) AS event_count
FROM events
GROUP BY DATE(timestamp)
ORDER BY event_date;

-- 7. 统计每个用户的事件数量（用户活跃度）
SELECT 
  user_id,
  COUNT(*) AS event_count
FROM events
GROUP BY user_id
ORDER BY event_count DESC;

-- 8. 统计新注册用户的每日增长趋势
SELECT 
  DATE(signup_date) AS signup_day,
  COUNT(*) AS new_users
FROM users
GROUP BY DATE(signup_date)
ORDER BY signup_day;

-- 9. 查询最活跃的前 10 个用户
SELECT 
  user_id,
  COUNT(*) AS total_actions
FROM events
GROUP BY user_id
ORDER BY total_actions DESC
LIMIT 10;

-- 10. 事件类型 × 性别（用户行为与性别关系）
SELECT 
  u.gender,
  e.event_type,
  COUNT(*) AS count
FROM events e
JOIN users u ON e.user_id = u.user_id
GROUP BY u.gender, e.event_type
ORDER BY u.gender, count DESC;
