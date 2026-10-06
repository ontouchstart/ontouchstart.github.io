import { test } from "bun:test";

test("Streaming Response", async () => {
  const cmd = "const res = await fetch('https://jsonplaceholder.typicode.com/posts'); const reader = res.body.getReader(); let decoded = ''; while (true) { const { done, value } = await reader.read(); if (done) break; decoded += new TextDecoder().decode(value); } console.log('Received chunked data length:', decoded.length);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Reading a response as a stream.");
  console.log("How: Use .body.getReader() to process chunks as they arrive.");
  console.log("Why: Extremely memory efficient for large file downloads or real-time data.");
});
