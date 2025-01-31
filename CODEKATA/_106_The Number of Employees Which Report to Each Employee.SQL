SELECT e.employee_id, e.name, COUNT(*) AS reports_count, ROUND(AVG(t.age),0) as average_age
FROM Employees as e
         JOIN Employees as t
              ON e.employee_id = t.reports_to
GROUP BY e.employee_id
ORDER BY e.employee_id