-- get total assignment duration for students in FEB12 cohort
SELECT assignment_submissions.duration
FROM assignment_submissions

-- link students to assignment submissions table by student id
JOIN students ON assignment_submissions.student_id = students.id

-- link cohorts in FEB12 cohort to students table by student id
JOIN cohorts ON students.cohort_id = cohorts.id 
WHERE cohorts.name = 'FEB12';