import { test } from "bun:test";

test("Bun.YAML", async () => {
  const cmd = "const yaml = Bun.YAML.parse('key: value\\nlist: [1, 2, 3]'); console.log(yaml);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Parse YAML data.");
  console.log("How: Use Bun.YAML.parse() to convert YAML strings to objects.");
  console.log("Why: High-performance YAML parsing built into the runtime.");
});
