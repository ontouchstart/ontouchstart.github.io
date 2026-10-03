use rusqlite::{params, Connection, Result};

#[cfg(test)]
mod tests {
    use super::*;

    #[derive(Debug, PartialEq)]
    struct Profile {
        bio: Option<String>,
        age: i32,
    }

    #[derive(Debug, PartialEq)]
    struct User {
        id: i32,
        name: String,
        profile: Profile,
    }

    #[test]
    fn test_open_in_memory_connection() {
        let conn = Connection::open_in_memory();
        assert!(conn.is_ok());
    }

    #[test]
    fn test_create_table_and_insert() {
        let conn = Connection::open_in_memory().unwrap();
        conn.execute(
            "CREATE TABLE users (
                id    INTEGER PRIMARY KEY,
                name  TEXT NOT NULL,
                age   INTEGER NOT NULL
            )",
            [],
        ).unwrap();

        conn.execute(
            "INSERT INTO users (name, age) VALUES (?1, ?2)",
            params!["Alice", 30],
        ).unwrap();

        conn.execute(
            "INSERT INTO users (name, age) VALUES (?1, ?2)",
            params!["Bob", 25],
        ).unwrap();

        let mut stmt = conn.prepare("SELECT name, age FROM users ORDER BY age").unwrap();
        let user_iter = stmt.query_map([], |row| {
            Ok((row.get::<_, String>(0)?, row.get::<_, i32>(1)?))
        }).unwrap();

        let mut results = Vec::new();
        for user in user_iter {
            results.push(user.unwrap());
        }

        assert_eq!(results.len(), 2);
        assert_eq!(results[0], ("Bob".to_string(), 25));
        assert_eq!(results[1], ("Alice".to_string(), 30));
    }

    #[test]
    fn test_prepared_statement() {
        let conn = Connection::open_in_memory().unwrap();
        conn.execute(
            "CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT)",
            [],
        ).unwrap();

        let mut stmt = conn.prepare("INSERT INTO products (name) VALUES (?)").unwrap();
        stmt.execute(params!["Laptop"]).unwrap();
        stmt.execute(params!["Phone"]).unwrap();

        let mut stmt = conn.prepare("SELECT name FROM products").unwrap();
        let names: Vec<String> = stmt.query_map([], |row| row.get(0)).unwrap().map(|r| r.unwrap()).collect();
        assert_eq!(names, vec!["Laptop", "Phone"]);
    }

    #[test]
    fn test_transaction() {
        let mut conn = Connection::open_in_memory().unwrap();
        conn.execute(
            "CREATE TABLE accounts (id INTEGER PRIMARY KEY, balance INTEGER)",
            [],
        ).unwrap();
        conn.execute(
            "INSERT INTO accounts (id, balance) VALUES (1, 1000)",
            [],
        ).unwrap();

        let tx = conn.transaction().unwrap();
        tx.execute("UPDATE accounts SET balance = balance - 100 WHERE id = 1", []).unwrap();
        tx.commit().unwrap();

        let balance: i32 = conn.query_row("SELECT balance FROM accounts WHERE id = 1", [], |row| row.get(0)).unwrap();
        assert_eq!(balance, 900);
    }

    #[test]
    fn test_transaction_rollback() {
        let mut conn = Connection::open_in_memory().unwrap();
        conn.execute(
            "CREATE TABLE accounts (id INTEGER PRIMARY KEY, balance INTEGER)",
            [],
        ).unwrap();
        conn.execute(
            "INSERT INTO accounts (id, balance) VALUES (1, 1000)",
            [],
        ).unwrap();

        let tx = conn.transaction().unwrap();
        tx.execute("UPDATE accounts SET balance = balance - 100 WHERE id = 1", []).unwrap();
        // Drop transaction without commit to rollback
        drop(tx);

        let balance: i32 = conn.query_row("SELECT balance FROM accounts WHERE id = 1", [], |row| row.get(0)).unwrap();
        assert_eq!(balance, 1000);
    }

    #[test]
    fn test_multiple_types_and_nullability() {
        let conn = Connection::open_in_memory().unwrap();
        conn.execute(
            "CREATE TABLE items (
                id          INTEGER PRIMARY KEY,
                name        TEXT NOT NULL,
                price       REAL NOT NULL,
                description TEXT,
                data        BLOB
            )",
            [],
        ).unwrap();

        // Test with a NULL description
        conn.execute(
            "INSERT INTO items (name, price, description, data) VALUES (?1, ?2, ?3, ?4)",
            params!["Widget", 19.99, None::<String>, Some(vec![1u8, 2, 3])],
        ).unwrap();

        // Test with a non-NULL description
        conn.execute(
            "INSERT INTO items (name, price, description, data) VALUES (?1, ?2, ?3, ?4)",
            params!["Gadget", 29.99, Some("Useful tool".to_string()), None::<Vec<u8>>],
        ).unwrap();

        let mut stmt = conn.prepare("SELECT name, price, description, data FROM items").unwrap();
        let iter = stmt.query_map([], |row| {
            Ok((
                row.get::<_, String>(0)?,
                row.get::<_, f64>(1)?,
                row.get::<_, Option<String>>(2)?,
                row.get::<_, Option<Vec<u8>>>(3)?,
            ))
        }).unwrap();

        let mut results = Vec::new();
        for item in iter {
            results.push(item.unwrap());
        }

        assert_eq!(results.len(), 2);
        assert_eq!(results[0], ("Widget".to_string(), 19.99, None, Some(vec![1, 2, 3])));
        assert_eq!(results[1], ("Gadget".to_string(), 29.99, Some("Useful tool".to_string()), None));
    }

    #[test]
    fn test_complex_struct() {
        let conn = Connection::open_in_memory().unwrap();
        conn.execute(
            "CREATE TABLE users (
                id       INTEGER PRIMARY KEY,
                name     TEXT NOT NULL,
                bio      TEXT,
                age      INTEGER NOT NULL
            )",
            [],
        ).unwrap();

        conn.execute(
            "INSERT INTO users (name, bio, age) VALUES (?1, ?2, ?3)",
            params!["Steven", Some("Software Engineer".to_string()), 30],
        ).unwrap();

        let mut stmt = conn.prepare("SELECT id, name, bio, age FROM users").unwrap();
        let user_iter = stmt.query_map([], |row| {
            Ok(User {
                id: row.get(0)?,
                name: row.get(1)?,
                profile: Profile {
                    bio: row.get(2)?,
                    age: row.get(3)?,
                },
            })
        }).unwrap();

        let mut results = Vec::new();
        for user in user_iter {
            results.push(user.unwrap());
        }

        assert_eq!(results.len(), 1);
        assert_eq!(results[0], User {
            id: 1,
            name: "Steven".to_string(),
            profile: Profile {
                bio: Some("Software Engineer".to_string()),
                age: 30,
            },
        });
    }

    #[test]
    fn test_aggregates() {
        let conn = Connection::open_in_memory().unwrap();
        conn.execute(
            "CREATE TABLE sales (
                id INTEGER PRIMARY KEY,
                amount REAL
            )",
            [],
        ).unwrap();

        conn.execute("INSERT INTO sales (amount) VALUES (10.5)", []).unwrap();
        conn.execute("INSERT INTO sales (amount) VALUES (20.0)", []).unwrap();
        conn.execute("INSERT INTO sales (amount) VALUES (30.5)", []).unwrap();

        let sum: f64 = conn.query_row("SELECT SUM(amount) FROM sales", [], |row| row.get(0)).unwrap();
        let avg: f64 = conn.query_row("SELECT AVG(amount) FROM sales", [], |row| row.get(0)).unwrap();
        let count: i64 = conn.query_row("SELECT COUNT(*) FROM sales", [], |row| row.get(0)).unwrap();

        assert_eq!(sum, 61.0);
        assert_eq!(avg, 20.333333333333332);
        assert_eq!(count, 3);
    }

    #[test]
    fn test_joins_and_limits() {
        let conn = Connection::open_in_memory().unwrap();
        conn.execute(
            "CREATE TABLE authors (
                id INTEGER PRIMARY KEY,
                name TEXT NOT NULL
            )",
            [],
        ).unwrap();

        conn.execute(
            "CREATE TABLE books (
                id INTEGER PRIMARY KEY,
                title TEXT NOT NULL,
                author_id INTEGER NOT NULL,
                FOREIGN KEY(author_id) REFERENCES authors(id)
            )",
            [],
        ).unwrap();

        conn.execute("INSERT INTO authors (name) VALUES ('J.R.R. Tolkien')", []).unwrap();
        conn.execute("INSERT INTO authors (name) VALUES ('George R.R. Martin')", []).unwrap();

        conn.execute("INSERT INTO books (title, author_id) VALUES ('The Hobbit', 1)", []).unwrap();
        conn.execute("INSERT INTO books (title, author_id) VALUES ('The Silmarillion', 1)", []).unwrap();
        conn.execute("INSERT INTO books (title, author_id) VALUES ('A Game of Thrones', 2)", []).unwrap();

        let mut stmt = conn.prepare(
            "SELECT b.title, a.name 
             FROM books b 
             JOIN authors a ON b.author_id = a.id 
             ORDER BY b.title 
             LIMIT 2",
        ).unwrap();

        let iter = stmt.query_map([], |row| {
            Ok((row.get::<_, String>(0)?, row.get::<_, String>(1)?))
        }).unwrap();

        let mut results = Vec::new();
        for item in iter {
            results.push(item.unwrap());
        }

        assert_eq!(results.len(), 2);
        assert_eq!(results[0], ("A Game of Thrones".to_string(), "George R.R. Martin".to_string()));
        assert_eq!(results[1], ("The Hobbit".to_string(), "J.R.R. Tolkien".to_string()));
    }

    #[test]
    fn test_statement_reuse() {
        let conn = Connection::open_in_memory().unwrap();
        conn.execute(
            "CREATE TABLE items (id INTEGER PRIMARY KEY, name TEXT)",
            [],
        ).unwrap();

        let mut stmt = conn.prepare("INSERT INTO items (name) VALUES (?)").unwrap();
        stmt.execute(params!["A"]).unwrap();
        stmt.execute(params!["B"]).unwrap();
        stmt.execute(params!["C"]).unwrap();

        let mut stmt = conn.prepare("SELECT name FROM items WHERE id = ?").unwrap();
        let row1 = stmt.query_row([1], |row| row.get::<_, String>(0)).unwrap();
        let row2 = stmt.query_row([2], |row| row.get::<_, String>(0)).unwrap();
        let row3 = stmt.query_row([3], |row| row.get::<_, String>(0)).unwrap();

        assert_eq!(row1, "A");
        assert_eq!(row2, "B");
        assert_eq!(row3, "C");
    }

    #[test]
    fn test_file_persistence() {
        let path = "/tmp/test_db.db";
        // Ensure the file doesn't exist
        let _ = std::fs::remove_file(path);

        {
            let conn = Connection::open(path).unwrap();
            conn.execute(
                "CREATE TABLE test (id INTEGER PRIMARY KEY, val TEXT)",
                [],
            ).unwrap();
            conn.execute("INSERT INTO test (val) VALUES ('hello')", []).unwrap();
        } // Connection closed

        {
            let conn = Connection::open(path).unwrap();
            let val: String = conn.query_row("SELECT val FROM test", [], |row| row.get(0)).unwrap();
            assert_eq!(val, "hello");
        }

        let _ = std::fs::remove_file(path);
    }

    #[test]
    fn test_error_verification() {
        let conn = Connection::open_in_memory().unwrap();
        conn.execute(
            "CREATE TABLE users (
                id INTEGER PRIMARY KEY,
                name TEXT NOT NULL UNIQUE
            )",
            [],
        ).unwrap();

        conn.execute("INSERT INTO users (name) VALUES ('Alice')", []).unwrap();
        
        // This should fail due to UNIQUE constraint
        let result = conn.execute("INSERT INTO users (name) VALUES ('Alice')", []);
        assert!(result.is_err());
        
        let err = result.unwrap_err();
        // Check if it's a Constraint violation (SQLITE_CONSTRAINT)
        assert_eq!(err.sqlite_error_code(), Some(rusqlite::ErrorCode::ConstraintViolation));
    }
}

fn main() {
    println!("Hello, world!");
}
