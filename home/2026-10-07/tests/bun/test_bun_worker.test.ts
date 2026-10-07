import { test } from "bun:test";

test("Worker API", async () => {
  const cmd = `console.log('Worker constructor exists:', !!Worker);`;
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Check for Web Worker support.");
  console.log("How: Check for the Worker constructor.");
  console.log("Why: Offload heavy tasks to background threads.");
});
