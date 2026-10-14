import { Buffer } from 'node:buffer';
import { writeFileSync } from 'node:fs';
import { dirname, basename } from 'node:path';
import { fileURLToPath } from 'node:url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const url = process.argv[2];

if (!url) {
  console.error("Please provide a URL as an argument.");
  process.exit(1);
}

async function fetchAndSave() {
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

    // Generate a filename from the URL
    let filename = "output.md";
    try {
      const urlObj = new URL(url);
      const pathParts = urlObj.pathname.split('/').filter(Boolean);
      if (pathParts.length > 0) {
        filename = pathParts.join('_') + ".md";
      } else if (urlObj.hostname) {
        filename = urlObj.hostname.replace(/\./g, '_') + ".md";
      }
    } catch (e) {
      // Fallback to default
    }

    // Sanitize filename (remove illegal characters)
    filename = filename.replace(/[<>:"\/\\|?*]/g, '_');

    writeFileSync(filename, cleanText);
    console.log(`Successfully saved content to ${filename}`);
  } catch (error) {
    console.error("Error:", error);
    process.exit(1);
  }
}

fetchAndSave();
