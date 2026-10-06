import { test } from "bun:test";

test("Check llama.cpp server chat completions", async () => {
  const baseUrl = "http://host.docker.internal:8080/v1";
  console.log(`Checking chat completions at ${baseUrl}`);

  try {
    const res = await fetch(`${baseUrl}/chat/completions`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        model: "models/gemma-4-12B-it-Q8_0.gguf",
        messages: [
          {
            role: "user",
            content: "Hello!",
          },
        ],
        max_tokens: 10,
      }),
    });
    const data = await res.json();
    console.log("Response Status:", res.status);
    console.log("Response Data:", JSON.stringify(data, null, 2));
  } catch (e) {
    console.log("Error connecting to server:", e.message);
  }
}, { timeout: 30000 });
