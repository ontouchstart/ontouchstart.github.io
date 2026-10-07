import { test } from "bun:test";

test("Bun.write", async () => {
  const cmd = "await Bun.write('test_write.txt', 'Hello from Bun.write'); console.log('File written');";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Write data to a file.");
  console.log("How: Use Bun.write() to write content to a file path.");
  console.log("Why: Fast, direct file writing API.");
});
