import { test } from "bun:test";

test("BroadcastChannel API", async () => {
  const cmd = `const bc = new BroadcastChannel('test_channel');
  bc.postMessage('Hello from the other side!');
  bc.onmessage = (ev) => console.log('Received:', ev.data);
  // Give it a moment to receive the message
  await new Promise(r => setTimeout(r, 100));
  bc.close();`;
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Send messages to other scripts on the same origin.");
  console.log("How: Use the BroadcastChannel API.");
  console.log("Why: Easy way to communicate between different scripts/tabs.");
});
