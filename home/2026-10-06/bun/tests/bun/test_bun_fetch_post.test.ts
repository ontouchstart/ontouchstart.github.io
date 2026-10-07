import { test } from "bun:test";

test("POST Request with JSON Body", async () => {
  const cmd = "const res = await fetch('https://jsonplaceholder.typicode.com/posts', { method: 'POST', body: JSON.stringify({ title: 'foo', body: 'bar', userId: 1 }), headers: { 'Content-type': 'application/json; charset=UTF-8' } }); const data = await res.json(); console.log(data);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: POST request with a JSON payload.");
  console.log("How: Specify method, body (stringified), and appropriate headers.");
  console.log("Why: Standard way to create resources on a server.");
});
