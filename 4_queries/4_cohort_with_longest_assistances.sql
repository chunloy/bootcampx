--  name  | average_assistance_time 
-- -------+-------------------------
--  MAR12 | 00:15:44.556041
-- (1 row)

SELECT cohorts.name as name, avg(assistance_requests.completed_at-assistance_requests.started_at) as longest_average_assistance_time
FROM assistance_requests
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY longest_average_assistance_time DESC
LIMIT 1;