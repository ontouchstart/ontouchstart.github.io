import { execSync } from "node:child_process";
import { readFileSync } from "node:fs";

try {
  console.log("Step 3: Running calculation script...");
  execSync("bun run calculate.ts");
  
  console.log("Step 3: Reading result file...");
  const data = JSON.parse(readFileSync("result.json", "utf8"));
  
  console.log("--- Feedback Received ---");
  console.log(`Status: ${data.status}`);
  console.log(`Value: ${data.value}`);
  console.log(`Message: ${data.message}`);
  console.log("--------------------------");
} catch (error) {
  console.error("Feedback Loop Failed:", error.message);
  process.exit(1);
}
