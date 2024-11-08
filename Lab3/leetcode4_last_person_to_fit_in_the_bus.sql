-- Write your PostgreSQL query statement below

With CumulativeWeightTable AS (
    SELECT turn, person_name, weight, 
        SUM(weight)
        OVER (ORDER BY turn) as "Total Weight"
    FROM Queue
)
SELECT person_name
FROM CumulativeWeightTable
WHERE "Total Weight" <= 1000
ORDER BY turn DESC
LIMIT 1