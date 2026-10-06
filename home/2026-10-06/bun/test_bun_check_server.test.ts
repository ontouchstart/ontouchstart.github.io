import { test } from "bun:test";

test("Check llama.cpp server models", async () => {
  const baseUrl = "http://host.docker.internal:8080/v1";
  console.log(`Checking models at ${baseUrl}`);

  try {
    const res = await fetch(`${baseUrl}/models`);
    const data = await res.json();
    console.log("Response Status:", res.status);
    console.log("Response Data:", JSON.stringify(data, null, 2));
  } catch (e) {
    console.log("Error connecting to server:", e.message);
  }
});
