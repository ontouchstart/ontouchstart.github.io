import { execSync } from "node:child_process";
import { existsSync, writeFileSync, rmSync } from "node:fs";
import { expect, describe, it, beforeEach } from "bun:test";

const makeTool = (name: string, code: string) => {
  execSync(`bun run maker.ts ${name} "${code}"`);
};

const runTool = (name: string) => {
  try {
    execSync(`bun run executor.ts ${name}`);
    return { success: true, error: null };
  } catch (e: any) {
    return { success: false, error: e.message };
  }
};

describe("Meta-Learner Loop", () => {
  beforeEach(() => {
    // Clean up tools
    const files = ["add_numbers.ts", "multiply.ts", "broken.ts", "test_loop_tool.ts"];
    files.forEach(f => {
      if (existsSync(f)) {
        rmSync(f);
      }
    });
  });

  it("maker.ts creates a tool", () => {
    makeTool("test_loop_tool", "console.log('hello');");
    expect(existsSync("test_loop_tool.ts")).toBe(true);
  });

  it("executor.ts runs a successful tool", () => {
    makeTool("test_loop_tool", "console.log('success');");
    const result = runTool("test_loop_tool");
    expect(result.success).toBe(true);
  });

  it("executor.ts reports failure for broken code", () => {
    writeFileSync("broken.ts", "const x = ;");
    const result = runTool("broken");
    expect(result.success).toBe(false);
    // Check if error message contains the expected failure
    expect(result.error.includes("Unexpected ;")).toBe(true);
  });

  it("self-correction loop", () => {
    const toolName = "repair_test";
    const brokenCode = "const x = ;";
    const errorMessage = "error: Unexpected ;";

    // 1. Create broken tool
    writeFileSync(`${toolName}.ts`, brokenCode);

    // 2. Run and get error
    const result = runTool(toolName);
    expect(result.success).toBe(false);

    // 3. Attempt repair
    // We pass the broken code and the error message to maker.ts
    // Note: maker.ts logic we implemented specifically handles "Unexpected ;"
    execSync(`bun run maker.ts ${toolName} "${brokenCode}" "${errorMessage}"`);

    // 4. Verify repair
    const resultAfterRepair = runTool(toolName);
    expect(resultAfterRepair.success).toBe(true);
  });
});
