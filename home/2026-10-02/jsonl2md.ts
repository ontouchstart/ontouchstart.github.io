import readline from 'node:readline';

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
            let entryOutput = `## Entry ${data.id || 'N/A'}\n`;
            
            for (const [key, value] of Object.entries(data)) {
                if (key === 'message') {
                    if (typeof value === 'object' && value !== null && 'content' in value) {
                        // Handle complex message structure
                        const role = value.role || 'unknown';
                        entryOutput += `**Role**: ${role}\n\n`;
                        
                        for (const part of value.content) {
                            if (part.type === 'thinking') {
                                entryOutput += `> **Thinking**: \n> ${part.thinking}\n\n`;
                            } else if (part.type === 'text') {
                                entryOutput += `${part.text}\n\n`;
                            }
                        }
                    } else if (typeof value === 'string') {
                        entryOutput += `**${key}**: \n${value}\n\n`;
                    } else {
                        entryOutput += `**${key}**: \n${JSON.stringify(value, null, 2)}\n\n`;
                    }
                } else if (typeof value === 'object' && value !== null) {
                    entryOutput += `**${key}**: \n\`\`\`json\n${JSON.stringify(value, null, 2)}\n\`\`\`\n\n`;
                } else {
                    entryOutput += `**${key}**: ${value}\n\n`;
                }
            }
            entryOutput += '--- \n\n';
            
            process.stdout.write(entryOutput);
        } catch (err) {
            console.error(`Skipping invalid JSON line: ${trimmedLine.substring(0, 50)}${trimmedLine.length > 50 ? '...' : ''}`);
        }
    }
}

parseJsonl();
