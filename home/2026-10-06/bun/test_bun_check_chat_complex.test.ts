import { test } from "bun:test";

test("Check llama.cpp server complex chat", async () => {
  const baseUrl = "http://host.docker.internal:8080/v1";
  console.log(`Checking complex chat at ${baseUrl}`);

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
            content: "What is the capital of France?",
          },
        ],
        max_tokens: 50,
      }),
    });
    const data = await res.json();
    console.log("Response Status:", res.status);
    console.log("Response Data:", JSON.stringify(data, null, 2));

    if (data.choices && data.choices[0].message.content) {
      console.log("Success: Received content:", data.choices[0].message.content);
    } else {
      console.log("Warning: Received content is empty, but reasoning might be present.");
      if (data.choices && data.choices[0].message.reasoning_content) {
        console.log("Reasoning content:", data.choices[0].message.reasoning_content);
      }
    }
  } catch (e) {
    console.log("Error connecting to server:", e.message);
  }
}, { timeout: 30000 });
