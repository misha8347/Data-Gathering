-- Write your PostgreSQL query statement below

With SalaryRanking AS (
    SELECT id, departmentId, name, salary, 
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) as salary_rank
    FROM Employee
)

SELECT Department.name as "Department", SalaryRanking.name as "Employee", SalaryRanking.salary as "Salary"
FROM Department 
LEFT JOIN SalaryRanking
ON Department.id = SalaryRanking.departmentId
WHERE salary_rank <= 3