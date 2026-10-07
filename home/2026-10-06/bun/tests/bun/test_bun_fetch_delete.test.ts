import { test } from "bun:test";

test("DELETE Request", async () => {
  const cmd = "const res = await fetch('https://jsonplaceholder.typicode.com/posts/1', { method: 'DELETE' }); console.log('Status:', res.status);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: DELETE request.");
  console.log("How: Specify the DELETE method.");
  console.log("Why: Standard way to remove resources.");
});
