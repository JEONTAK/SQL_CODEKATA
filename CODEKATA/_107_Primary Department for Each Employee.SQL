SELECT employee_id, department_id
FROM (
         SELECT employee_id, department_id
         FROM Employee
         WHERE primary_flag = "Y"
     ) as A
UNION
SELECT employee_id, department_id
FROM (
         SELECT employee_id, department_id
         FROM Employee
         GROUP BY employee_id
         HAVING COUNT(*) = 1
     ) as B