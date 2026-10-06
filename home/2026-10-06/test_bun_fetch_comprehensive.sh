#!/usr/bin/env bash

# Bun Native Fetch API Comprehensive Exploration

echo "--- 1. Basic GET Request ---"
echo "Command: bun -e \"const res = await fetch('https://jsonplaceholder.typicode.com/todos/1'); const data = await res.json(); console.log(data);\""
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/todos/1'); const data = await res.json(); console.log(data);"
echo "What: Fetch data from an external URL."
echo "How: Use the built-in fetch() function."
echo "Why: Bun's fetch implementation is high-performance."

echo -e "\n--- 2. GET Request with Headers ---"
echo "Command: bun -e \"const res = await fetch('https://jsonplaceholder.typicode.com/todos/1', { headers: { 'Accept': 'application/json', 'X-Custom-Header': 'BunTest' } }); const data = await res.json(); console.log('Status:', res.status, 'Data:', data);\""
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/todos/1', { headers: { 'Accept': 'application/json', 'X-Custom-Header': 'BunTest' } }); const data = await res.json(); console.log('Status:', res.status, 'Data:', data);"
echo "What: GET request with custom headers."
echo "How: Pass a headers object as the second argument to fetch()."
echo "Why: Essential for API keys and content negotiation."

echo -e "\n--- 3. POST Request with JSON Body ---"
echo "Command: bun -e \"const res = await fetch('https://jsonplaceholder.typicode.com/posts', { method: 'POST', body: JSON.stringify({ title: 'foo', body: 'bar', userId: 1 }), headers: { 'Content-type': 'application/json; charset=UTF-8' } }); const data = await res.json(); console.log(data);\""
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/posts', { method: 'POST', body: JSON.stringify({ title: 'foo', body: 'bar', userId: 1 }), headers: { 'Content-type': 'application/json; charset=UTF-8' } }); const data = await res.json(); console.log(data);"
echo "What: POST request with a JSON payload."
echo "How: Specify method, body (stringified), and appropriate headers."
echo "Why: Standard way to create resources on a server."

echo -e "\n--- 4. PUT Request ---"
echo "Command: bun -e \"const res = await fetch('https://jsonplaceholder.typicode.com/posts/1', { method: 'PUT', body: JSON.stringify({ id: 1, title: 'updated', body: 'updated body', userId: 1 }), headers: { 'Content-type': 'application/json; charset=UTF-8' } }); const data = await res.json(); console.log(data);\""
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/posts/1', { method: 'PUT', body: JSON.stringify({ id: 1, title: 'updated', body: 'updated body', userId: 1 }), headers: { 'Content-type': 'application/json; charset=UTF-8' } }); const data = await res.json(); console.log(data);"
echo "What: PUT request to update a resource."
echo "How: Similar to POST, but specifying the target resource ID in the URL."

echo -e "\n--- 5. DELETE Request ---"
echo "Command: bun -e \"const res = await fetch('https://jsonplaceholder.typicode.com/posts/1', { method: 'DELETE' }); console.log('Status:', res.status);\""
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/posts/1', { method: 'DELETE' }); console.log('Status:', res.status);"
echo "What: DELETE request."
echo "How: Specify the DELETE method."
echo "Why: Standard way to remove resources."

echo -e "\n--- 6. Handling 404 Not Found ---"
echo "Command: bun -e \"const res = await fetch('https://jsonplaceholder.typicode.com/non-existent-page'); console.log('Status:', res.status);\""
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/non-existent-page'); console.log('Status:', res.status);"
echo "What: Handling a non-existent resource (404)."
echo "How: Check the status property of the response object."
echo "Why: Crucial for robust error handling in production."

echo -e "\n--- 7. Streaming Response ---"
echo "Command: bun -e \"const res = await fetch('https://jsonplaceholder.typicode.com/posts'); const reader = res.body.getReader(); let decoded = ''; while (true) { const { done, value } = await reader.read(); if (done) break; decoded += new TextDecoder().decode(value); } console.log('Received chunked data length:', decoded.length);\""
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/posts'); const reader = res.body.getReader(); let decoded = ''; while (true) { const { done, value } = await reader.read(); if (done) break; decoded += new TextDecoder().decode(value); } console.log('Received chunked data length:', decoded.length);"
echo "What: Reading a response as a stream."
echo "How: Use .body.getReader() to process chunks as they arrive."
echo "Why: Extremely memory efficient for large file downloads or real-time data."

echo -e "\n--- 9. POST with Large Body (Abort during Upload) ---"
echo "Command: bun -e \"const controller = new AbortController(); const id = setTimeout(() => controller.abort(), 100); let start = 0; try { console.log('Request starting...'); start = Date.now(); const largeData = { data: 'x'.repeat(5 * 1024 * 1024) }; console.log('Body prepared.'); const res = await fetch('https://jsonplaceholder.typicode.com/posts', { method: 'POST', body: JSON.stringify(largeData), headers: { 'Content-type': 'application/json; charset=UTF-8' }, signal: controller.signal }); console.log('Response headers received at:', Date.now() - start, 'ms'); const data = await res.json(); console.log('Body parsed at:', Date.now() - start, 'ms'); } catch (e) { console.log('Error at:', Date.now() - start, 'ms'); console.log('Caught expected error:', e.name); }\""
bun -e "const controller = new AbortController(); const id = setTimeout(() => controller.abort(), 100); let start = 0; try { console.log('Request starting...'); start = Date.now(); const largeData = { data: 'x'.repeat(5 * 1024 * 1024) }; console.log('Body prepared.'); const res = await fetch('https://jsonplaceholder.typicode.com/posts', { method: 'POST', body: JSON.stringify(largeData), headers: { 'Content-type': 'application/json; charset=UTF-8' }, signal: controller.signal }); console.log('Response headers received at:', Date.now() - start, 'ms'); const data = await res.json(); console.log('Body parsed at:', Date.now() - start, 'ms'); } catch (e) { console.log('Error at:', Date.now() - start, 'ms'); console.log('Caught expected error:', e.name); }"
echo "What: Aborting a fetch request using AbortController."
echo "How: Pass an AbortSignal to the fetch options."
echo "Why: Prevents resource leaks and allows for request cancellation (e.g. on component unmount)."

echo -e "\n--- Done ---"
