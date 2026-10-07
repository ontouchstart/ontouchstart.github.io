import { test } from "bun:test";

test("Bun.hash", async () => {
  const cmd = "const hash = Bun.hash('hello world'); console.log(hash);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Generate a hash using Bun.hash.");
  console.log("How: Use Bun.hash() to hash a string.");
  console.log("Why: Native and fast hashing API.");
});
