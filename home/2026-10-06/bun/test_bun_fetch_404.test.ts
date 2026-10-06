import { test } from "bun:test";

test("Handling 404 Not Found", async () => {
  const cmd = "const res = await fetch('https://jsonplaceholder.typicode.com/non-existent-page'); console.log('Status:', res.status);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Handling a non-existent resource (404).");
  console.log("How: Check the status property of the response object.");
  console.log("Why: Crucial for robust error handling in production.");
});
