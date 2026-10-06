import { test } from "bun:test";

test("GET Request with Headers", async () => {
  const cmd = "const res = await fetch('https://jsonplaceholder.typicode.com/todos/1', { headers: { 'Accept': 'application/json', 'X-Custom-Header': 'BunTest' } }); const data = await res.json(); console.log('Status:', res.status, 'Data:', data);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: GET request with custom headers.");
  console.log("How: Pass a headers object as the second argument to fetch().");
  console.log("Why: Essential for API keys and content negotiation.");
});
