import { Database } from "bun:sqlite";
import * as readline from "node:readline";

const db = new Database("jsonl.db");

// Create table if it doesn't exist
db.run("CREATE TABLE IF NOT EXISTS records (data TEXT)");

const insert = db.prepare("INSERT INTO records (data) VALUES (?)");

const rl = readline.createInterface({
  input: process.stdin,
  terminal: false
});

rl.on("line", (line) => {
  if (line.trim()) {
    insert.run(line);
  }
});

rl.on("close", () => {
  db.close();
});
