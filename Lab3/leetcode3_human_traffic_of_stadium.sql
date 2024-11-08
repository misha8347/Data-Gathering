-- Write your PostgreSQL query statement below
-- https://nphchi223.medium.com/daily-think-sql-lead-and-lag-for-consecutive-problems-1e6e1c4ca31

WITH ThreeDaysVisit AS (
    SELECT id, visit_date, people, 
        LAG(people, 1) OVER (ORDER BY id) as prev_people_count,
        LEAD(people, 1) OVER (ORDER BY id) as post_people_count,
        LAG(people, 2) OVER (ORDER BY id) as prev_people_count2,
        LEAD(people, 2) OVER (ORDER BY id) as post_people_count2
    FROM Stadium
)
SELECT id, visit_date, people
FROM ThreeDaysVisit
WHERE (prev_people_count2 >= 100 AND prev_people_count >= 100 AND people >= 100)
OR (prev_people_count >= 100 AND people >= 100 AND post_people_count >= 100)
OR (people >= 100 AND post_people_count >= 100 AND post_people_count2 >= 100)
    
