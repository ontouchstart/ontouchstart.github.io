import { test } from "bun:test";

test("Bun.semver", async () => {
  const cmd = "const version = Bun.semver.satisfies('1.2.3', '^1.0.0'); console.log(version);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Compare semantic versions.");
  console.log("How: Use Bun.semver.satisfies() to check if a version matches a range.");
  console.log("Why: Fast and native semver support.");
});
