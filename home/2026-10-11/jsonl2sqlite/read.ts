import { Database } from "bun:sqlite";

const db = new Database("jsonl.db");

const query = db.query("SELECT data FROM records");

for (const row of query.all()) {
  process.stdout.write(row.data + "\n");
}

db.close();
