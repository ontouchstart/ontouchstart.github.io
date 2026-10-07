import { test } from "bun:test";

test("HTMLRewriter", async () => {
  const cmd = `const rewriter = new HTMLRewriter().on('h1', {
    element(el) {
      el.setInnerContent('Hello from HTMLRewriter!');
    },
  });
  const html = '<html><body><h1>Original</h1></body></html>';
  const result = await rewriter.transform(new Response(html)).text();
  console.log(result);`;
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Transform HTML using HTMLRewriter.");
  console.log("How: Use HTMLRewriter to select elements and modify them.");
  console.log("Why: High-performance HTML manipulation.");
});
