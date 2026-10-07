import { test } from "bun:test";

test("Bun.TOML", async () => {
  const cmd = "const toml = Bun.TOML.parse('title = \"Test\"\\nversion = 1'); console.log(toml);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Parse TOML data.");
  console.log("How: Use Bun.TOML.parse() to convert TOML strings to objects.");
  console.log("Why: High-performance TOML parsing built into the runtime.");
});
