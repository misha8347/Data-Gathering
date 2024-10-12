import pandas as pd

#https://leetcode.com/problems/second-highest-salary/
def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    employee['rank'] = employee['salary'].rank(method='max')
    employee_without_first = employee[employee['rank'] != employee['rank'].max()]


    second_highest_salary = employee_without_first['salary'].max()
    ans = pd.DataFrame({
        'SecondHighestSalary': [second_highest_salary]
    })

    return ans
