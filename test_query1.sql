SELECT
    department,
    AVG(salary) AS average_salary
FROM employee_details
GROUP BY department;