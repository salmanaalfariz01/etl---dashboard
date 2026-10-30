
SELECT
  e.employee_id_number AS "NIK",
  e.full_name AS "Employee Name",
  e.gender AS "Gender",
  e.hire_date AS "Hire Date",
  e.status_active AS "Status",
  c.city_name AS "City",
  c.province AS "Province",
  d.department_name AS "Department",
  p.position_title AS "Position",
  p.job_level AS "Job Level",
  CASE
    WHEN e.status_active = 'Terminated' THEN 0
    ELSE COALESCE(s.net_salary, 0)
  END AS "Net Salary"
FROM
  employees e
  LEFT JOIN cities c ON e.city_id = c.city_id
  LEFT JOIN departments d ON e.department_id = d.department_id
  LEFT JOIN positions p ON e.position_id = p.position_id
  LEFT JOIN salaries s ON e.employee_id = s.employee_id
  AND s.period_date = '2026-10-01'
WHERE
  1 = 1 
  [[AND {{gender}}]] 
  [[AND {{department}}]] 
  [[AND {{city}}]] 
  [[AND {{province}}]] 
  [[AND {{status}}]] 
  [[AND {{position}}]] 
  [[AND {{job_level}}]]
order by s.net_salary desc