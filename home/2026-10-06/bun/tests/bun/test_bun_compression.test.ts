import { test } from "bun:test";

test("CompressionStream API", async () => {
  const cmd = `const str = "This is a string to compress.";
  const stream = new Blob([str]).stream();
  const compressedStream = stream.pipeThrough(new CompressionStream('gzip'));
  const compressed_response = new Response(compressedStream);
  const compressed_bytes = await compressed_response.arrayBuffer();
  console.log('Compressed size:', compressed_bytes.byteLength);`;
  console.log(`bun -e "${cmd}"`);

  Bun.spawnSync(["bun", "-e", cmd], {
    stdout: "inherit",
    stderr: "inherit",
  });

  console.log("What: Compress data using CompressionStream.");
  console.log("How: Pipe a stream through a new CompressionStream('gzip').");
  console.log("Why: Standardized stream compression for efficient data transfer.");
});
