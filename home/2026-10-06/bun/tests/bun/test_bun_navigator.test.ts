import { test } from "bun:test";

test("Navigator API", async () => {
  const cmd = "console.log(navigator.userAgent);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Check the user agent via navigator.");
  console.log("How: Use the navigator object.");
  console.log("Why: Standard Web API for browser/environment information.");
});
