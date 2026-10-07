import { test } from "bun:test";

test("Password Hashing", async () => {
  const cmd = "const hash = await Bun.password.hash('password123'); console.log(hash); const verify = await Bun.password.verify('password123', hash); console.log('Verified:', verify);";
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Securely hash a password.");
  console.log("How: Use Bun.password.hash() and Bun.password.verify().");
  console.log("Why: Bun provides a native, easy-to-use password hashing API.");
});
