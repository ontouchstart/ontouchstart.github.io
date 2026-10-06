# 2026-10-06/bun

https://ontouchstart.github.io/home/2026-10-06/bun

https://ontouchstart.github.io/home/2026-10-06/bun/2026-10-06T14-20-31-137Z_01a11196-6420-7388-b21a-65e8c9cdecae

https://ontouchstart.github.io/home/2026-10-06/bun/2026-10-06T16-57-38-858Z_01a11226-3f2a-77be-8f55-9f4ed8111496

https://ontouchstart.github.io/home/2026-10-06/bun/duck.ai_2026-10-06_12-12-23

https://ontouchstart.github.io/home/2026-10-06/bun/2026-10-06T19-30-45-780Z_01a112b2-6d93-70e4-833c-547d6c082d67

```
bash-5.3# nix develop --command bun test
bun test v1.4.2 (744846f84)

test_bun_check_chat.test.ts:
Checking chat completions at http://host.docker.internal:8080/v1
Response Status: 200
Response Data: {
  "choices": [
    {
      "finish_reason": "length",
      "index": 0,
      "message": {
        "role": "assistant",
        "content": "",
        "reasoning_content": "The user said \"Hello!\".\n"
      }
    }
  ],
  "created": 1791318166,
  "model": "models/gemma-4-12B-it-Q8_0.gguf",
  "system_fingerprint": "b11429-d81235049",
  "object": "chat.completion",
  "usage": {
    "completion_tokens": 10,
    "prompt_tokens": 18,
    "total_tokens": 28,
    "prompt_tokens_details": {
      "cached_tokens": 13
    }
  },
  "id": "chatcmpl-GMzK1cmjs9xnXpyOHDKSaGZujMkN1wkN",
  "timings": {
    "cache_n": 13,
    "prompt_n": 5,
    "prompt_ms": 312.666,
    "prompt_per_token_ms": 62.5332,
    "prompt_per_second": 15.991505312378065,
    "predicted_n": 10,
    "predicted_ms": 1297.859,
    "predicted_per_token_ms": 144.20655555555555,
    "predicted_per_second": 6.934497507048147
  }
}
✓ Check llama.cpp server chat completions [1745.48ms]

test_bun_check_chat_complex.test.ts:
Checking complex chat at http://host.docker.internal:8080/v1
Response Status: 200
Response Data: {
  "choices": [
    {
      "finish_reason": "stop",
      "index": 0,
      "message": {
        "role": "assistant",
        "content": "The capital of France is Paris.",
        "reasoning_content": "The user is asking for the capital of France.\nThe capital of France is Paris."
      }
    }
  ],
  "created": 1791318171,
  "model": "models/gemma-4-12B-it-Q8_0.gguf",
  "system_fingerprint": "b11429-d81235049",
  "object": "chat.completion",
  "usage": {
    "completion_tokens": 30,
    "prompt_tokens": 23,
    "total_tokens": 53,
    "prompt_tokens_details": {
      "cached_tokens": 7
    }
  },
  "id": "chatcmpl-TtjTDlPyGOqBGwM3CpHfwITPplVsLtRm",
  "timings": {
    "cache_n": 7,
    "prompt_n": 16,
    "prompt_ms": 587.816,
    "prompt_per_token_ms": 36.7385,
    "prompt_per_second": 27.219401989738284,
    "predicted_n": 30,
    "predicted_ms": 4442.636,
    "predicted_per_token_ms": 153.19434482758624,
    "predicted_per_second": 6.527656103268419
  }
}
Success: Received content: The capital of France is Paris.
✓ Check llama.cpp server complex chat [5055.33ms]

test_bun_check_server.test.ts:
Checking models at http://host.docker.internal:8080/v1
Response Status: 200
Response Data: {
  "models": [
    {
      "name": "models/gemma-4-12B-it-Q8_0.gguf",
      "model": "models/gemma-4-12B-it-Q8_0.gguf",
      "modified_at": "",
      "size": "",
      "digest": "",
      "type": "model",
      "description": "",
      "tags": [
        ""
      ],
      "capabilities": [
        "completion"
      ],
      "parameters": "",
      "details": {
        "parent_model": "",
        "format": "gguf",
        "family": "",
        "families": [
          ""
        ],
        "parameter_size": "",
        "quantization_level": ""
      }
    }
  ],
  "object": "list",
  "data": [
    {
      "id": "models/gemma-4-12B-it-Q8_0.gguf",
      "aliases": [
        "models/gemma-4-12B-it-Q8_0.gguf"
      ],
      "tags": [],
      "object": "model",
      "architecture": {
        "input_modalities": [
          "text"
        ],
        "output_modalities": [
          "text"
        ]
      },
      "created": 1791318171,
      "owned_by": "llamacpp",
      "meta": {
        "vocab_type": 2,
        "n_vocab": 262144,
        "n_ctx": 193024,
        "n_ctx_train": 262144,
        "n_embd": 3840,
        "n_params": 11907350576,
        "size": 12653822144,
        "ftype": "Q8_0"
      }
    }
  ]
}
✓ Check llama.cpp server models [3.27ms]

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
✓ Native Fetch API [187.27ms]

test_bun_fetch_404.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/non-existent-page'); console.log('Status:', res.status);"
Status: 404
What: Handling a non-existent resource (404).
How: Check the status property of the response object.
Why: Crucial for robust error handling in production.
✓ Handling 404 Not Found [91.80ms]

test_bun_fetch_abort.test.ts:
bun -e "const controller = new AbortController(); const id = setTimeout(() => controller.abort(), 100); let start = 0; try { console.log('Request starting...'); start = Date.now(); const largeData = { data: 'x'.repeat(5 * 1024 * 1024) }; console.log('Body prepared.'); const res = await fetch('https://jsonplaceholder.typicode.com/posts', { method: 'POST', body: JSON.stringify(largeData), headers: { 'Content-type': 'application/json; charset=UTF-8' }, signal: controller.signal }); console.log('Response headers received at:', Date.now() - start, 'ms'); const data = await res.json(); console.log('Body parsed at:', Date.now() - start, 'ms'); } catch (e) { console.log('Error at:', Date.now() - start, 'ms'); console.log('Caught expected error:', e.name); }"
Request starting...
Body prepared.
Error at: 102 ms
Caught expected error: AbortError
What: Aborting a fetch request using AbortController.
How: Pass an AbortSignal to the fetch options.
Why: Prevents resource leaks and allows for request cancellation (e.g. on component unmount).
✓ POST with Large Body (Abort during Upload) [117.62ms]

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
✓ Basic GET Request [231.92ms]

test_bun_fetch_delete.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/posts/1', { method: 'DELETE' }); console.log('Status:', res.status);"
Status: 200
What: DELETE request.
How: Specify the DELETE method.
Why: Standard way to remove resources.
✓ DELETE Request [851.76ms]

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
✓ GET Request with Headers [81.81ms]

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
✓ POST Request with JSON Body [91.97ms]

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
✓ PUT Request [97.34ms]

test_bun_fetch_streaming.test.ts:
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/posts'); const reader = res.body.getReader(); let decoded = ''; while (true) { const { done, value } = await reader.read(); if (done) break; decoded += new TextDecoder().decode(value); } console.log('Received chunked data length:', decoded.length);"
Received chunked data length: 27520
What: Reading a response as a stream.
How: Use .body.getReader() to process chunks as they arrive.
Why: Extremely memory efficient for large file downloads or real-time data.
✓ Streaming Response [70.32ms]

test_bun_file_reading.test.ts:
bun -e "const f = Bun.file('test_bun.sh'); const text = await f.text(); console.log(text.split('\n').length)"
42
What: Read a file's line count.
How: Use Bun.file() to get a file handle and .text() to read content, then split by newline.
Why: Bun.file() is optimized for fast I/O.
✓ Fast File Reading [8.39ms]

test_bun_json.test.ts:
bun -e "const data = JSON.parse('{"users": [{"id": 1, "name": "Alice"}, {"id": 2, "name": "Bob"}]}'); const updated = data.users.map(u => ({...u, active: true})); console.log(JSON.stringify(updated));"
[{"id":1,"name":"Alice","active":true},{"id":2,"name":"Bob","active":true}]
What: Parse and transform JSON data.
How: Use standard JSON.parse/stringify with JS array methods.
Why: Bun's runtime is extremely fast for JSON operations.
✓ JSON Manipulation [8.81ms]

test_bun_password.test.ts:
bun -e "const hash = await Bun.password.hash('password123'); console.log(hash); const verify = await Bun.password.verify('password123', hash); console.log('Verified:', verify);"
$argon2id$v=19$m=65536,t=2,p=1$EknCn3i6WwnuWobmaNn/CldQVf8P4d95tVJEpIIw9jU$INYgRgo87yOdPeIU9UYC1dai6zI6F2x/86IF0VPMi3E
Verified: true
What: Securely hash a password.
How: Use Bun.password.hash() and Bun.password.verify().
Why: Bun provides a native, easy-to-use password hashing API.
✓ Password Hashing [268.38ms]

test_bun_timer.test.ts:
bun -e "const start = Bun.nanoseconds(); console.log('Doing work...'); await new Promise(r => setTimeout(r, 100)); console.log('Time taken:', (Bun.nanoseconds() - start) / 1000000, 'ms');"
Doing work...
Time taken: 105.686083 ms
What: Measure execution time with nanosecond precision.
How: Use Bun.nanoseconds() to get current time in nanoseconds.
Why: Bun.nanoseconds() is a very fast way to get high-resolution timing.
✓ High-Resolution Timer [109.98ms]

 16 pass
 0 fail
Ran 16 tests across 16 files. [9.05s]
```
