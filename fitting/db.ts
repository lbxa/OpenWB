import { Database } from 'bun:sqlite';

// Open a connection to the SQLite database
const db = new Database('fitting_run.db');

// Insert some data
// db.run('INSERT INTO users (name, age) VALUES (?, ?)', 'Alice', 30);
// db.run('INSERT INTO users (name, age) VALUES (?, ?)', 'Bob', 25);

// Query the data
const rows = db.query(`
  SELECT 
    v.variable_name,
    v.value,
    c.iteration_number
  FROM variables v
  JOIN candidates c ON v.candidate_id = c.id
  WHERE c.iteration_number = 19 AND v.variable_name like '%h'
`).all();

// Print the results
for (const row of rows){
  console.log(row.variable_name + ": " + row.value)
}

// Close the database connection
db.close();

