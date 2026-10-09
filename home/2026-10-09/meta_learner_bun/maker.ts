import { writeFileSync } from "node:fs";

const args = process.argv.slice(2);
if (args.length < 2) {
  console.error("Usage: bun run maker.ts <tool_name> <code_snippet>");
  process.exit(1);
}

const toolName = args[0];
const code = args[1];

const filename = `${toolName}.ts`;

try {
  writeFileSync(filename, code);
  console.log(`[SUCCESS] Tool '${toolName}' has been created.`);
} catch (error) {
  console.error(`[ERROR] Failed to create tool: ${error.message}`);
  process.exit(1);
}
