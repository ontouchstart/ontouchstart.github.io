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
  console.error(error.message);
  process.exit(1);
}
