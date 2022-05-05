const { Pool } = require('pg');

const pool = new Pool({
  user: 'aaronau',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
SELECT DISTINCT teachers.name as name, cohorts.name as cohort
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teachers.name;
`;

const values = [process.argv[2]];

pool.query(queryString, values)
  .then(response => {
    response.rows.forEach(user => {
      console.log(`${user.cohort}: ${user.name}`);
    });
  })
  .catch(error => console.error('query error', error.stack));