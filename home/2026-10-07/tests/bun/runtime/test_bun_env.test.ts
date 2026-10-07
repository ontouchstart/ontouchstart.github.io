import { test } from "bun:test";

test("Bun.env", async () => {
  const cmd = "console.log(Bun.env.PWD);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Access environment variables.");
  console.log("How: Use Bun.env to access variables.");
  console.log("Why: Fast and direct environment variable access.");
});
