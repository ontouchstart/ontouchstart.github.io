import { test } from "bun:test";

test("Bun.CSRF", async () => {
  const cmd = "const token = Bun.CSRF.generate(); console.log('Token generated');";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Generate CSRF tokens.");
  console.log("How: Use Bun.CSRF.generate() to create a token.");
  console.log("Why: Native CSRF protection support.");
});
