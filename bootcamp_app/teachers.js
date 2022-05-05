const { Pool } = require('pg');

const pool = new Pool({
  user: 'aaronau',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT DISTINCT teachers.name as name, cohorts.name as cohort
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = '${process.argv[2]}'
ORDER BY teachers.name;
`)
  .then(response => {
    console.log(response.rows);
    response.rows.forEach(user => {
      console.log(`${user.cohort}: ${user.name}`);
    });
  })
  .catch(error => console.error('query error', error.stack));