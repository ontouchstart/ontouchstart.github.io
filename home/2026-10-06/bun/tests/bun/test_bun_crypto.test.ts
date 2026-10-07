import { test } from "bun:test";

test("Crypto API - SHA-256", async () => {
  const cmd = `const data = new TextEncoder().encode("hello world");
  const hashBuffer = await crypto.subtle.digest("SHA-256", data);
  const hashArray = Array.from(new Uint8Array(hashBuffer));
  const hashHex = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
  console.log(hashHex);`;
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Generate a SHA-256 hash using the Web Crypto API.");
  console.log("How: Use crypto.subtle.digest().");
  console.log("Why: Standardized, high-performance cryptography.");
});
