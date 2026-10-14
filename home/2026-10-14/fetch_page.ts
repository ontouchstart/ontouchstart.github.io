import { Buffer } from 'node:buffer';

const url = "https://www.anthropic.com/engineering/redesigning-source-control";

async function fetchPage() {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`Failed to fetch: ${response.statusText}`);
    }
    const html = await response.text();
    
    // Simple text extraction: remove script and style tags
    const cleanText = html
      .replace(/<script\b[^>]*>([\s\S]*?)<\/script>/gmi, '')
      .replace(/<style\b[^>]*>([\s\S]*?)<\/style>/gmi, '')
      .replace(/<[^>]*>/g, ' ')
      .replace(/\s+/g, ' ')
      .trim();

    console.log(cleanText);
  } catch (error) {
    console.error("Error fetching page:", error);
  }
}

fetchPage();
