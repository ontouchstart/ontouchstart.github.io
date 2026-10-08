# 2026-10-07

https://ontouchstart.github.io/home/2026-10-07/2026-10-07T22-56-25-692Z_01a11895-145b-73f4-9249-182259271184

```
bash-5.3# nix develop --command bun test
bun test v1.4.2 (744846f84)

tests/bun/test_bun_fetch_streaming.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/posts'); const reader = res.body.getReader(); let decoded = ''; while (true) { const { done, value } = await reader.read(); if (done) break; decoded += new TextDecoder().decode(value); } console.log('Received chunked data length:', decoded.length);"
Received chunked data length: 27520
What: Reading a response as a stream.
How: Use .body.getReader() to process chunks as they arrive.
Why: Extremely memory efficient for large file downloads or real-time data.
✓ Streaming Response [105.15ms]

tests/bun/test_bun_json.test.ts:
bun -e "const data = JSON.parse('{"users": [{"id": 1, "name": "Alice"}, {"id": 2, "name": "Bob"}]}'); const updated = data.users.map(u => ({...u, active: true})); console.log(JSON.stringify(updated));"
[{"id":1,"name":"Alice","active":true},{"id":2,"name":"Bob","active":true}]
What: Parse and transform JSON data.
How: Use standard JSON.parse/stringify with JS array methods.
Why: Bun's runtime is extremely fast for JSON operations.
✓ JSON Manipulation [7.14ms]

tests/bun/test_bun_timer.test.ts:
bun -e "const start = Bun.nanoseconds(); console.log('Doing work...'); await new Promise(r => setTimeout(r, 100)); console.log('Time taken:', (Bun.nanoseconds() - start) / 1000000, 'ms');"
Doing work...
Time taken: 106.238917 ms
What: Measure execution time with nanosecond precision.
How: Use Bun.nanoseconds() to get current time in nanoseconds.
Why: Bun.nanoseconds() is a very fast way to get high-resolution timing.
✓ High-Resolution Timer [112.33ms]

tests/bun/test_bun_crypto.test.ts:
bun -e "const data = new TextEncoder().encode("hello world");
  const hashBuffer = await crypto.subtle.digest("SHA-256", data);
  const hashArray = Array.from(new Uint8Array(hashBuffer));
  const hashHex = hashArray.map(b => b.toString(16).padStart(2, '0')).join('');
  console.log(hashHex);"
b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9
What: Generate a SHA-256 hash using the Web Crypto API.
How: Use crypto.subtle.digest().
Why: Standardized, high-performance cryptography.
✓ Crypto API - SHA-256 [7.23ms]

tests/bun/test_bun_password.test.ts:
bun -e "const hash = await Bun.password.hash('password123'); console.log(hash); const verify = await Bun.password.verify('password123', hash); console.log('Verified:', verify);"
$argon2id$v=19$m=65536,t=2,p=1$OTvG/VrHlPA1UZRBrAUgCDw3F7tnTzOw6US9xjVVPZk$YhzBy2ObB6hjwgui2w4IR/8Nz6FOvZmD/SbH+p/yReQ
Verified: true
What: Securely hash a password.
How: Use Bun.password.hash() and Bun.password.verify().
Why: Bun provides a native, easy-to-use password hashing API.
✓ Password Hashing [308.67ms]

tests/bun/test_bun_fetch_headers.test.ts:
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
✓ GET Request with Headers [72.21ms]

tests/bun/test_bun_htmlrewriter.test.ts:
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
✓ HTMLRewriter [4.18ms]

tests/bun/test_bun_fetch_post.test.ts:
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
✓ POST Request with JSON Body [74.47ms]

tests/bun/test_bun_fetch.test.ts:
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
✓ Native Fetch API [66.33ms]

tests/bun/test_bun_fetch_put.test.ts:
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
✓ PUT Request [87.54ms]

tests/bun/test_bun_fetch_basic.test.ts:
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
✓ Basic GET Request [65.57ms]

tests/bun/test_bun_navigator.test.ts:
bun -e "console.log(navigator.userAgent);"
Bun/1.4.2
What: Check the user agent via navigator.
How: Use the navigator object.
Why: Standard Web API for browser/environment information.
✓ Navigator API [3.54ms]

tests/bun/test_bun_compression.test.ts:
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
✓ CompressionStream API [3.60ms]

tests/bun/test_bun_fetch_404.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/non-existent-page'); console.log('Status:', res.status);"
Status: 404
What: Handling a non-existent resource (404).
How: Check the status property of the response object.
Why: Crucial for robust error handling in production.
✓ Handling 404 Not Found [64.51ms]

tests/bun/test_bun_broadcastchannel.test.ts:
bun -e "const bc = new BroadcastChannel('test_channel');
  bc.postMessage('Hello from the other side!');
  bc.onmessage = (ev) => console.log('Received:', ev.data);
  // Give it a moment to receive the message
  await new Promise(r => setTimeout(r, 100));
  bc.close();"
What: Send messages to other scripts on the same origin.
How: Use the BroadcastChannel API.
Why: Easy way to communicate between different scripts/tabs.
✓ BroadcastChannel API [104.87ms]

tests/bun/test_bun_worker.test.ts:
bun -e "console.log('Worker constructor exists:', !!Worker);"
Worker constructor exists: true
What: Check for Web Worker support.
How: Check for the Worker constructor.
Why: Offload heavy tasks to background threads.
✓ Worker API [4.67ms]

tests/bun/test_bun_urlpattern.test.ts:
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
✓ URLPattern API [3.44ms]

tests/bun/test_bun_file_reading.test.ts:
bun -e "const f = Bun.file('tests/bun/test_bun.sh'); const text = await f.text(); console.log(text.split('\n').length)"
5
What: Read a file's line count.
How: Use Bun.file() to get a file handle and .text() to read content, then split by newline.
Why: Bun.file() is optimized for fast I/O.
✓ Fast File Reading [3.10ms]

tests/bun/test_bun_globals.test.ts:
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

tests/bun/test_bun_fetch_delete.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/posts/1', { method: 'DELETE' }); console.log('Status:', res.status);"
Status: 200
What: DELETE request.
How: Specify the DELETE method.
Why: Standard way to remove resources.
✓ DELETE Request [77.38ms]

tests/bun/test_bun_fetch_abort.test.ts:
bun -e "const controller = new AbortController(); const id = setTimeout(() => controller.abort(), 100); let start = 0; try { console.log('Request starting...'); start = Date.now(); const largeData = { data: 'x'.repeat(5 * 1024 * 1024) }; console.log('Body prepared.'); const res = await fetch('https://jsonplaceholder.typicode.com/posts', { method: 'POST', body: JSON.stringify(largeData), headers: { 'Content-type': 'application/json; charset=UTF-8' }, signal: controller.signal }); console.log('Response headers received at:', Date.now() - start, 'ms'); const data = await res.json(); console.log('Body parsed at:', Date.now() - start, 'ms'); } catch (e) { console.log('Error at:', Date.now() - start, 'ms'); console.log('Caught expected error:', e.name); }"
Request starting...
Body prepared.
Error at: 103 ms
Caught expected error: AbortError
What: Aborting a fetch request using AbortController.
How: Pass an AbortSignal to the fetch options.
Why: Prevents resource leaks and allows for request cancellation (e.g. on component unmount).
✓ POST with Large Body (Abort during Upload) [109.01ms]

tests/bun/utils/test_bun_toml.test.ts:
bun -e "const toml = Bun.TOML.parse('title = "Test"\nversion = 1'); console.log(toml);"
{
  title: "Test",
  version: 1,
}
What: Parse TOML data.
How: Use Bun.TOML.parse() to convert TOML strings to objects.
Why: High-performance TOML parsing built into the runtime.
✓ Bun.TOML [4.49ms]

tests/bun/utils/test_bun_yaml.test.ts:
bun -e "const yaml = Bun.YAML.parse('key: value\nlist: [1, 2, 3]'); console.log(yaml);"
{
  key: "value",
  list: [ 1, 2, 3 ],
}
What: Parse YAML data.
How: Use Bun.YAML.parse() to convert YAML strings to objects.
Why: High-performance YAML parsing built into the runtime.
✓ Bun.YAML [3.58ms]

tests/bun/utils/test_bun_semver.test.ts:
bun -e "const version = Bun.semver.satisfies('1.2.3', '^1.0.0'); console.log(version);"
true
What: Compare semantic versions.
How: Use Bun.semver.satisfies() to check if a version matches a range.
Why: Fast and native semver support.
✓ Bun.semver [3.18ms]

tests/bun/utils/test_bun_hash.test.ts:
bun -e "const hash = Bun.hash('hello world'); console.log(hash);"
7389666205914310003n
What: Generate a hash using Bun.hash.
How: Use Bun.hash() to hash a string.
Why: Native and fast hashing API.
✓ Bun.hash [2.84ms]

tests/bun/runtime/test_bun_write.test.ts:
bun -e "await Bun.write('test_write.txt', 'Hello from Bun.write'); console.log('File written');"
File written
What: Write data to a file.
How: Use Bun.write() to write content to a file path.
Why: Fast, direct file writing API.
✓ Bun.write [3.28ms]

tests/bun/runtime/test_bun_env.test.ts:
bun -e "console.log(Bun.env.PWD);"
/home/2026-10-07
What: Access environment variables.
How: Use Bun.env to access variables.
Why: Fast and direct environment variable access.
✓ Bun.env [3.55ms]

tests/bun/runtime/test_bun_path_conversion.test.ts:
bun -e "console.log(Bun.fileURLToPath(new URL('file:///tmp'))); console.log(Bun.pathToFileURL('/tmp'));"
/tmp
URL {
  href: 'file:///tmp',
  origin: 'null',
  protocol: 'file:',
  username: '',
  password: '',
  host: '',
  hostname: '',
  port: '',
  pathname: '/tmp',
  search: '',
  searchParams: URLSearchParams {},
  hash: ''
}
What: Convert between file URLs and absolute paths.
How: Use Bun.fileURLToPath() and Bun.pathToFileURL().
Why: Easy path manipulation for different environments.
✓ Bun.pathToFileURL / Bun.fileURLToPath [11.24ms]

tests/bun/networking/test_bun_csrf.test.ts:
bun -e "const token = Bun.CSRF.generate(); console.log('Token generated');"
Token generated
What: Generate CSRF tokens.
How: Use Bun.CSRF.generate() to create a token.
Why: Native CSRF protection support.
✓ Bun.CSRF [3.48ms]

 28 pass
 0 fail
Ran 28 tests across 29 files. [1343.00ms]
```
