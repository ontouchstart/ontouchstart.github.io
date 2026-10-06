import { test } from "bun:test";

test("Native Fetch API", async () => {
  const cmd = "const res = await fetch('https://jsonplaceholder.typicode.com/todos/1'); const data = await res.json(); console.log(data);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Fetch data from an external URL.");
  console.log("How: Use the built-in fetch() function.");
  console.log("Why: Bun's fetch implementation is high-performance.");
});
