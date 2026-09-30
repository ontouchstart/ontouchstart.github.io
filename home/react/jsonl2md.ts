import readline from 'node:readline';

/**
 * Recursively renders a JSON object/value into Markdown.
 * @param data The JSON data to render.
 * @param depth The current nesting depth (used to determine header level).
 */
function render(data: any, depth: number): void {
    if (data === null || typeof data !== 'object') {
        // Handle primitive values
        process.stdout.write(`${data}\n\n`);
        return;
    }

    if (Array.isArray(data)) {
        // Handle arrays by prefixing items with a list bullet
        for (const item of data) {
            process.stdout.write(`- \n`);
            render(item, depth);
        }
        return;
    }

    // Handle objects by creating headers for each key
    for (const [key, value] of Object.entries(data)) {
        const header = '#'.repeat(depth);
        process.stdout.write(`${header} ${key}\n`);
        render(value, depth + 1);
    }
}

async function parseJsonl() {
    const rl = readline.createInterface({
        input: process.stdin,
        terminal: false
    });

    for await (const line of rl) {
        const trimmedLine = line.trim();
        if (!trimmedLine) continue;
        try {
            const data = JSON.parse(trimmedLine);
            
            // Entry header - Level 2
            process.stdout.write(`## Entry ${data.id || 'N/A'}\n\n`);
            
            // Start recursive rendering from depth 3
            // (Since Entry is Level 2, the first level of keys in the object is Level 3)
            render(data, 3);
            
            process.stdout.write('--- \n\n');
        } catch (err) {
            console.error(`Skipping invalid JSON line: ${trimmedLine.substring(0, 50)}${trimmedLine.length > 50 ? '...' : ''}`);
        }
    }
}

parseJsonl();
