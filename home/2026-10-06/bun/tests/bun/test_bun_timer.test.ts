import { test } from "bun:test";

test("High-Resolution Timer", async () => {
  const cmd = "const start = Bun.nanoseconds(); console.log('Doing work...'); await new Promise(r => setTimeout(r, 100)); console.log('Time taken:', (Bun.nanoseconds() - start) / 1000000, 'ms');";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Measure execution time with nanosecond precision.");
  console.log("How: Use Bun.nanoseconds() to get current time in nanoseconds.");
  console.log("Why: Bun.nanoseconds() is a very fast way to get high-resolution timing.");
});
