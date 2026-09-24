const sqlite3 = require('sqlite3').verbose();

// Connect to an in-memory database
const db = new sqlite3.Database(':memory:', (err) => {
  if (err) {
    console.error(err.message);
    return;
  }
  console.log('Connected to the in-memory SQLite database.');
});

db.serialize(() => {
  // Create a table
  db.run('CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)', (err) => {
    if (err) {
      console.error(err.message);
    } else {
      console.log('Table "users" created.');
    }
  });

  // Insert data
  const stmt = db.prepare('INSERT INTO users (name, age) VALUES (?, ?)');
  stmt.run('Alice', 25);
  stmt.run('Bob', 30);
  stmt.finalize((err) => {
    if (err) {
      console.error(err.message);
    } else {
      console.log('Data inserted.');
    }
  });

  // Query data
  db.each('SELECT id, name, age FROM users', (err, row) => {
    if (err) {
      console.error(err.message);
    } else {
      console.log(`User: ${row.id}, Name: ${row.name}, Age: ${row.age}`);
    }
  });
});

// Close the database
db.close((err) => {
  if (err) {
    console.error(err.message);
  } else {
    console.log('Database connection closed.');
  }
});
