import { test } from "bun:test";

test("PUT Request", async () => {
  const cmd = "const res = await fetch('https://jsonplaceholder.typicode.com/posts/1', { method: 'PUT', body: JSON.stringify({ id: 1, title: 'updated', body: 'updated body', userId: 1 }), headers: { 'Content-type': 'application/json; charset=UTF-8' } }); const data = await res.json(); console.log(data);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: PUT request to update a resource.");
  console.log("How: Similar to POST, but specifying the target resource ID in the URL.");
  console.log("Why: Standard way to update resources.");
});
