const { Pool } = require('pg');

const pool = new Pool({
  user: 'aaronau',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohort = process.argv[2];
const limit = process.argv[3];

pool.query(`
  SELECT students.id, students.name as name, cohorts.name as cohort
  FROM cohorts
  JOIN students on cohort_id = cohorts.id
  WHERE cohorts.name like '%${cohort}%'
  LIMIT ${limit};
`)
  .then(response => {
    response.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohort`);
    });
  })
  .catch(error => console.error('query error', error.stack));