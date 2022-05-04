--       teacher       |         student          |    assignment    | duration 
-- --------------------+--------------------------+------------------+----------
--  Helmer Rodriguez   | Maximillian Pfannerstill | Expedita officia | 00:02:45
--  Roberto Towne      | Vivien Mosciski          | Ea totam iste    | 00:02:45
--  Georgiana Fahey    | Gene Carter              | Ut fuga          | 00:02:45
--  Cheyanne Powlowski | Vivien Mosciski          | Eum eaque        | 00:02:45
--  Roberto Towne      | Maximillia Willms        | Quibusdam est    | 00:03:00
-- (26299 rows)

SELECT teachers.name as teacher,
students.name as student,
assignments.name as assignment,
(assistance_requests.completed_at - assistance_requests.started_at) as duration
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN assignments ON assistance_requests.assignment_id = assignments.id
ORDER BY duration;