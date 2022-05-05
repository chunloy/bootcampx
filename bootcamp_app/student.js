const { Pool } = require('pg');

const pool = new Pool({
  user: 'aaronau',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
  SELECT students.id, students.name as name, cohorts.name as cohort
  FROM students
  JOIN cohorts on cohort_id = cohorts.id
  LIMIT 5;
`)
  .then(response => {
    response.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohort`);
    });
  })
  .catch(error => console.error('query error', error.stack));