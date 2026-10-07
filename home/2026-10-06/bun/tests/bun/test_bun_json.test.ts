import { test } from "bun:test";

test("JSON Manipulation", async () => {
  const cmd = "const data = JSON.parse('{\"users\": [{\"id\": 1, \"name\": \"Alice\"}, {\"id\": 2, \"name\": \"Bob\"}]}'); const updated = data.users.map(u => ({...u, active: true})); console.log(JSON.stringify(updated));";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Parse and transform JSON data.");
  console.log("How: Use standard JSON.parse/stringify with JS array methods.");
  console.log("Why: Bun's runtime is extremely fast for JSON operations.");
});
