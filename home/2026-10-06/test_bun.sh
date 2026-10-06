#!/usr/bin/env bash

# Bun Capabilities Exploration
# Based on the pattern of jq exploration.

echo "--- 1. Fast File Reading ---"
echo "Command: bun -e \"const f = Bun.file('test_bun.sh'); const text = await f.text(); console.log(text.split('\\n').length)\""
bun -e "const f = Bun.file('test_bun.sh'); const text = await f.text(); console.log(text.split('\\n').length)"
echo "What: Read a file's line count."
echo "How: Use Bun.file() to get a file handle and .text() to read content, then split by newline."
echo "Why: Bun.file() is optimized for fast I/O."

echo -e "\n--- 2. Native Fetch API ---"
echo "Command: bun -e \"const res = await fetch('https://jsonplaceholder.typicode.com/todos/1'); const data = await res.json(); console.log(data);\""
bun -e "const res = await fetch('https://jsonplaceholder.typicode.com/todos/1'); const data = await res.json(); console.log(data);"
echo "What: Fetch data from an external URL."
echo "How: Use the built-in fetch() function."
echo "Why: Bun's fetch implementation is high-performance."

echo -e "\n--- 3. Password Hashing ---"
echo "Command: bun -e \"const hash = await Bun.password.hash('password123'); console.log(hash); const verify = await Bun.password.verify('password123', hash); console.log('Verified:', verify);\""
bun -e "const hash = await Bun.password.hash('password123'); console.log(hash); const verify = await Bun.password.verify('password123', hash); console.log('Verified:', verify);"
echo "What: Securely hash a password."
echo "How: Use Bun.password.hash() and Bun.password.verify()."
echo "Why: Bun provides a native, easy-to-use password hashing API."

echo -e "\n--- 4. High-Resolution Timer ---"
echo "Command: bun -e \"const start = Bun.nanoseconds(); console.log('Doing work...'); await new Promise(r => setTimeout(r, 100)); console.log('Time taken:', (Bun.nanoseconds() - start) / 1000000, 'ms');\""
bun -e "const start = Bun.nanoseconds(); console.log('Doing work...'); await new Promise(r => setTimeout(r, 100)); console.log('Time taken:', (Bun.nanoseconds() - start) / 1000000, 'ms');"
echo "What: Measure execution time with nanosecond precision."
echo "How: Use Bun.nanoseconds() to get current time in nanoseconds."
echo "Why: Bun.nanoseconds() is a very fast way to get high-resolution timing."

echo -e "\n--- 5. JSON Manipulation ---"
echo "Command: bun -e \"const data = JSON.parse('{\\\"users\\\": [{\\\"id\\\": 1, \\\"name\\\": \\\"Alice\\\"}, {\\\"id\\\": 2, \\\"name\\\": \\\"Bob\\\"}]}'); const updated = data.users.map(u => ({...u, active: true})); console.log(JSON.stringify(updated));\""
bun -e "const data = JSON.parse('{\"users\": [{\"id\": 1, \"name\": \"Alice\"}, {\"id\": 2, \"name\": \"Bob\"}]}'); const updated = data.users.map(u => ({...u, active: true})); console.log(JSON.stringify(updated));"
echo "What: Parse and transform JSON data."
echo "How: Use standard JSON.parse/stringify with JS array methods."
echo "Why: Bun's runtime is extremely fast for JSON operations."

echo -e "\n--- Done ---"
