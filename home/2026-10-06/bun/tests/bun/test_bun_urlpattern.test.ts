import { test } from "bun:test";

test("URLPattern API", async () => {
  const cmd = `const pattern = new URLPattern({ pathname: '/user/:id' });
  const url = new URL('https://example.com/user/123');
  const match = pattern.exec(url);
  console.log('Match:', match ? 'Success' : 'Failure');
  if (match) {
    console.log('Params:', match.pathname.groups);
  }`;
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Match URLs against patterns.");
  console.log("How: Use the URLPattern API.");
  console.log("Why: Powerful and efficient URL matching for routing.");
});
