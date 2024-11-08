-- Write your PostgreSQL query statement below

WITH ManagerIdsWithMoreThanFiveReports AS (
    SELECT A.id
    FROM Employee A
    INNER JOIN Employee B
    ON A.id = B.managerId
    GROUP BY A.id
    HAVING COUNT(A.id) >= 5
)
SELECT name 
FROM Employee
JOIN ManagerIdsWithMoreThanFiveReports
ON Employee.id = ManagerIdsWithMoreThanFiveReports.id
