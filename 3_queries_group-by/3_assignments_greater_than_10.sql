-- count all assignments
SELECT day, count(*) as total_assignments 
FROM assignments
-- group counts by day
GROUP BY assignments.day
-- filter by assignments >=10
HAVING count(*) >= 10
-- sort by day
ORDER BY assignments.day;