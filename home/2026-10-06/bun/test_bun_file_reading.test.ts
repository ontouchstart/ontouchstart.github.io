import { test } from "bun:test";

test("Fast File Reading", async () => {
  const cmd = "const f = Bun.file('test_bun.sh'); const text = await f.text(); console.log(text.split('\\n').length)";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Read a file's line count.");
  console.log("How: Use Bun.file() to get a file handle and .text() to read content, then split by newline.");
  console.log("Why: Bun.file() is optimized for fast I/O.");
});
