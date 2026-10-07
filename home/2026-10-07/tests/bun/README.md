https://ontouchstart.github.io/home/2026-10-06/bun/tests/bun

https://ontouchstart.github.io/home/2026-10-06/bun/tests/bun/2026-10-07T00-13-55-011Z_01a113b5-a9c1-7370-8050-b21a65f8d2bb

```
bash-5.3# nix develop --command bun test
path "/home/2026-10-06/bun/tests/bun" does not contain a 'flake.nix', searching up
bun test v1.4.2 (744846f84)

test_bun_broadcastchannel.test.ts:
bun -e "const bc = new BroadcastChannel('test_channel');
  bc.postMessage('Hello from the other side!');
  bc.onmessage = (ev) => console.log('Received:', ev.data);
  // Give it a moment to receive the message
  await new Promise(r => setTimeout(r, 100));
  bc.close();"
What: Send messages to other scripts on the same origin.
How: Use the BroadcastChannel API.
Why: Easy way to communicate between different scripts/tabs.
✓ BroadcastChannel API [125.47ms]

test_bun_compression.test.ts:
bun -e "const str = "This is a string to compress.";
  const stream = new Blob([str]).stream();
  const compressedStream = stream.pipeThrough(new CompressionStream('gzip'));
  const compressed_response = new Response(compressedStream);
  const compressed_bytes = await compressed_response.arrayBuffer();
  console.log('Compressed size:', compressed_bytes.byteLength);"
Compressed size: 49
What: Compress data using CompressionStream.
How: Pipe a stream through a new CompressionStream('gzip').
Why: Standardized stream compression for efficient data transfer.
✓ CompressionStream API [11.73ms]

test_bun_crypto.test.ts:
bun -e "const data = new TextEncoder().encode("hello world");
  const hashBuffer = await crypto.subtle.digest("SHA-256", data);
  const hashArray = Array.from(new Uint8Array(hashBuffer));
  const hashHex = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
  console.log(hashHex);"
b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9
What: Generate a SHA-256 hash using the Web Crypto API.
How: Use crypto.subtle.digest().
Why: Standardized, high-performance cryptography.
✓ Crypto API - SHA-256 [8.21ms]

test_bun_fetch.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/todos/1'); const data = await res.json(); console.log(data);"
{
  userId: 1,
  id: 1,
  title: "delectus aut autem",
  completed: false,
}
What: Fetch data from an external URL.
How: Use the built-in fetch() function.
Why: Bun's fetch implementation is high-performance.
✓ Native Fetch API [137.01ms]

test_bun_fetch_404.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/non-existent-page'); console.log('Status:', res.status);"
Status: 404
What: Handling a non-existent resource (404).
How: Check the status property of the response object.
Why: Crucial for robust error handling in production.
✓ Handling 404 Not Found [74.71ms]

test_bun_fetch_abort.test.ts:
bun -e "const controller = new AbortController(); const id = setTimeout(() => controller.abort(), 100); let start = 0; try { console.log('Request starting...'); start = Date.now(); const largeData = { data: 'x'.repeat(5 * 1024 * 1024) }; console.log('Body prepared.'); const res = await fetch('https://jsonplaceholder.typicode.com/posts', { method: 'POST', body: JSON.stringify(largeData), headers: { 'Content-type': 'application/json; charset=UTF-8' }, signal: controller.signal }); console.log('Response headers received at:', Date.now() - start, 'ms'); const data = await res.json(); console.log('Body parsed at:', Date.now() - start, 'ms'); } catch (e) { console.log('Error at:', Date.now() - start, 'ms'); console.log('Caught expected error:', e.name); }"
Request starting...
Body prepared.
Error at: 106 ms
Caught expected error: AbortError
What: Aborting a fetch request using AbortController.
How: Pass an AbortSignal to the fetch options.
Why: Prevents resource leaks and allows for request cancellation (e.g. on component unmount).
✓ POST with Large Body (Abort during Upload) [112.87ms]

test_bun_fetch_basic.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/todos/1'); const data = await res.json(); console.log(data);"
{
  userId: 1,
  id: 1,
  title: "delectus aut autem",
  completed: false,
}
What: Fetch data from an external URL.
How: Use the built-in fetch() function.
Why: Bun's fetch implementation is high-performance.
✓ Basic GET Request [176.80ms]

test_bun_fetch_delete.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/posts/1', { method: 'DELETE' }); console.log('Status:', res.status);"
Status: 200
What: DELETE request.
How: Specify the DELETE method.
Why: Standard way to remove resources.
✓ DELETE Request [327.65ms]

test_bun_fetch_headers.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/todos/1', { headers: { 'Accept': 'application/json', 'X-Custom-Header': 'BunTest' } }); const data = await res.json(); console.log('Status:', res.status, 'Data:', data);"
Status: 200 Data: {
  userId: 1,
  id: 1,
  title: "delectus aut autem",
  completed: false,
}
What: GET request with custom headers.
How: Pass a headers object as the second argument to fetch().
Why: Essential for API keys and content negotiation.
✓ GET Request with Headers [79.96ms]

test_bun_fetch_post.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/posts', { method: 'POST', body: JSON.stringify({ title: 'foo', body: 'bar', userId: 1 }), headers: { 'Content-type': 'application/json; charset=UTF-8' } }); const data = await res.json(); console.log(data);"
{
  title: "foo",
  body: "bar",
  userId: 1,
  id: 101,
}
What: POST request with a JSON payload.
How: Specify method, body (stringified), and appropriate headers.
Why: Standard way to create resources on a server.
✓ POST Request with JSON Body [103.42ms]

test_bun_fetch_put.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/posts/1', { method: 'PUT', body: JSON.stringify({ id: 1, title: 'updated', body: 'updated body', userId: 1 }), headers: { 'Content-type': 'application/json; charset=UTF-8' } }); const data = await res.json(); console.log(data);"
{
  id: 1,
  title: "updated",
  body: "updated body",
  userId: 1,
}
What: PUT request to update a resource.
How: Similar to POST, but specifying the target resource ID in the URL.
Why: Standard way to update resources.
✓ PUT Request [120.93ms]

test_bun_fetch_streaming.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/posts'); const reader = res.body.getReader(); let decoded = ''; while (true) { const { done, value } = await reader.read(); if (done) break; decoded += new TextDecoder().decode(value); } console.log('Received chunked data length:', decoded.length);"
Received chunked data length: 27520
What: Reading a response as a stream.
How: Use .body.getReader() to process chunks as they arrive.
Why: Extremely memory efficient for large file downloads or real-time data.
✓ Streaming Response [105.80ms]

test_bun_file_reading.test.ts:
bun -e "const f = Bun.file('test_bun.sh'); const text = await f.text(); console.log(text.split('\n').length)"
42
What: Read a file's line count.
How: Use Bun.file() to get a file handle and .text() to read content, then split by newline.
Why: Bun.file() is optimized for fast I/O.
✓ Fast File Reading [8.27ms]

test_bun_globals.test.ts:
Global properties: [
  "addEventListener", "alert", "atob", "btoa", "clearImmediate", "clearInterval", "clearTimeout",
  "confirm", "dispatchEvent", "fetch", "postMessage", "prompt", "queueMicrotask", "removeEventListener",
  "reportError", "setImmediate", "setInterval", "setTimeout", "structuredClone", "global", "Bun",
  "File", "crypto", "navigator", "performance", "process", "Blob", "Buffer", "BuildError", "BuildMessage",
  "Crypto", "HTMLRewriter", "Request", "ResolveError", "ResolveMessage", "Response", "TextDecoder",
  "AbortController", "AbortSignal", "BroadcastChannel", "CloseEvent", "CompressionStream", "CryptoKey",
  "CustomEvent", "DecompressionStream", "DOMException", "ErrorEvent", "Event", "EventTarget",
  "FormData", "Headers", "MessageChannel", "MessageEvent", "MessagePort", "Performance", "PerformanceEntry",
  "PerformanceMark", "PerformanceMeasure", "PerformanceObserver", "PerformanceObserverEntryList",
  "PerformanceResourceTiming", "PerformanceServerTiming", "PerformanceTiming", "SubtleCrypto",
  "TextDecoderStream", "TextEncoder", "TextEncoderStream", "URLPattern", "WebSocket", "Worker",
  "self", "onmessage", "onerror"
]

test_bun_htmlrewriter.test.ts:
bun -e "const rewriter = new HTMLRewriter().on('h1', {
    element(el) {
      el.setInnerContent('Hello from HTMLRewriter!');
    },
  });
  const html = '<html><body><h1>Original</h1></body></html>';
  const result = await rewriter.transform(new Response(html)).text();
  console.log(result);"
<html><body><h1>Hello from HTMLRewriter!</h1></body></html>
What: Transform HTML using HTMLRewriter.
How: Use HTMLRewriter to select elements and modify them.
Why: High-performance HTML manipulation.
✓ HTMLRewriter [10.44ms]

test_bun_json.test.ts:
bun -e "const data = JSON.parse('{"users": [{"id": 1, "name": "Alice"}, {"id": 2, "name": "Bob"}]}'); const updated = data.users.map(u => ({...u, active: true})); console.log(JSON.stringify(updated));"
[{"id":1,"name":"Alice","active":true},{"id":2,"name":"Bob","active":true}]
What: Parse and transform JSON data.
How: Use standard JSON.parse/stringify with JS array methods.
Why: Bun's runtime is extremely fast for JSON operations.
✓ JSON Manipulation [4.57ms]

test_bun_navigator.test.ts:
bun -e "console.log(navigator.userAgent);"
Bun/1.4.2
What: Check the user agent via navigator.
How: Use the navigator object.
Why: Standard Web API for browser/environment information.
✓ Navigator API [4.28ms]

test_bun_password.test.ts:
bun -e "const hash = await Bun.password.hash('password123'); console.log(hash); const verify = await Bun.password.verify('password123', hash); console.log('Verified:', verify);"
$argon2id$v=19$m=65536,t=2,p=1$6K4X9gJMqYNbY6v9140OaHFfIcITZnW/K5gEFe+mp4I$aO9EJ7+W77dYOViP3JUUCzD4uA1mDSQ53zQplw5hsds
Verified: true
What: Securely hash a password.
How: Use Bun.password.hash() and Bun.password.verify().
Why: Bun provides a native, easy-to-use password hashing API.
✓ Password Hashing [252.94ms]

test_bun_timer.test.ts:
bun -e "const start = Bun.nanoseconds(); console.log('Doing work...'); await new Promise(r => setTimeout(r, 100)); console.log('Time taken:', (Bun.nanoseconds() - start) / 1000000, 'ms');"
Doing work...
Time taken: 105.815584 ms
What: Measure execution time with nanosecond precision.
How: Use Bun.nanoseconds() to get current time in nanoseconds.
Why: Bun.nanoseconds() is a very fast way to get high-resolution timing.
✓ High-Resolution Timer [112.90ms]

test_bun_urlpattern.test.ts:
bun -e "const pattern = new URLPattern({ pathname: '/user/:id' });
  const url = new URL('https://example.com/user/123');
  const match = pattern.exec(url);
  console.log('Match:', match ? 'Success' : 'Failure');
  if (match) {
    console.log('Params:', match.pathname.groups);
  }"
Match: Success
Params: {
  id: "123",
}
What: Match URLs against patterns.
How: Use the URLPattern API.
Why: Powerful and efficient URL matching for routing.
✓ URLPattern API [6.89ms]

test_bun_worker.test.ts:
bun -e "console.log('Worker constructor exists:', !!Worker);"
Worker constructor exists: true
What: Check for Web Worker support.
How: Check for the Worker constructor.
Why: Offload heavy tasks to background threads.
✓ Worker API [3.38ms]

 20 pass
 0 fail
Ran 20 tests across 21 files. [1.85s]
bash-5.3# 
```
