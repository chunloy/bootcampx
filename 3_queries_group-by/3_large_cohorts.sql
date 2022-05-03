SELECT cohorts.name as cohort_name, 
COUNT(students.id) as student_count
FROM cohorts
JOIN students on cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING COUNT(students.id) >= 18
ORDER BY count(students.id);