import { test } from "bun:test";

test("Bun.pathToFileURL / Bun.fileURLToPath", async () => {
  const cmd = "console.log(Bun.fileURLToPath(new URL('file:///tmp'))); console.log(Bun.pathToFileURL('/tmp'));";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Convert between file URLs and absolute paths.");
  console.log("How: Use Bun.fileURLToPath() and Bun.pathToFileURL().");
  console.log("Why: Easy path manipulation for different environments.");
});
