import { execSync } from "node:child_process";

const toolName = process.argv[2];

if (!toolName) {
  console.error("Error: No tool name provided.");
  process.exit(1);
}

console.log(`[ACTION] Executing ${toolName}...`);

try {
  execSync(`bun run ${toolName}`);
  console.log(`[RESULT] ${toolName} succeeded.`);
} catch (error) {
  console.error(`[RESULT] ${toolName} failed.`);
  // Capture the error message from the child process
  const errorMessage = error.stderr ? error.stderr.toString() : error.message;
  console.error(`ERROR: ${errorMessage}`);
  process.exit(1);
}
