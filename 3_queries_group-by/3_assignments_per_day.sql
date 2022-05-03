-- count all assignments
SELECT day, count(*) as total_assignments 
FROM assignments
-- group counts by day
GROUP BY assignments.day
-- sort by day
ORDER BY assignments.day;