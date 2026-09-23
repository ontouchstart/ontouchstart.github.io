async function parseJsonl(inputPath: string, outputPath: string) {
    const file = Bun.file(inputPath);
    const content = await file.text();
    
    if (!content || content.trim() === "") {
        console.warn(`Warning: Input file ${inputPath} is empty.`);
        await Bun.write(outputPath, `# JSONL Data Export\n\n(Empty file)`);
        return;
    }

    if (content.includes('\0')) {
        console.error(`Error: Input file ${inputPath} appears to be a binary file or contains null bytes.`);
        process.exit(1);
    }

    const lines = content.split("\n");

    let output = `# JSONL Data Export\n\n`;
    let validLines = 0;

    for (const line of lines) {
        const trimmedLine = line.trim();
        if (!trimmedLine) continue;
        try {
            const data = JSON.parse(trimmedLine);
            output += `## Entry ${data.id || 'N/A'}\n`;
            
            for (const [key, value] of Object.entries(data)) {
                if (key === 'message') {
                    if (typeof value === 'object' && value !== null && 'content' in value) {
                        // Handle complex message structure
                        const role = value.role || 'unknown';
                        output += `**Role**: ${role}\n\n`;
                        
                        for (const part of value.content) {
                            if (part.type === 'thinking') {
                                output += `> **Thinking**: \n> ${part.thinking}\n\n`;
                            } else if (part.type === 'text') {
                                output += `${part.text}\n\n`;
                            }
                        }
                    } else if (typeof value === 'string') {
                        output += `**${key}**: \n${value}\n\n`;
                    } else {
                        output += `**${key}**: \n${JSON.stringify(value, null, 2)}\n\n`;
                    }
                } else if (typeof value === 'object' && value !== null) {
                    output += `**${key}**: \n\`\`\`json\n${JSON.stringify(value, null, 2)}\n\`\`\`\n\n`;
                } else {
                    output += `**${key}**: ${value}\n\n`;
                }
            }
            output += '--- \n\n';
            validLines++;
        } catch (err) {
            if (trimmedLine.length > 1000) {
                console.error(`Error: Detected a very large non-JSON block in ${inputPath}. Is this a valid JSONL file?`);
                process.exit(1);
            }
            console.error(`Skipping invalid JSON line: ${trimmedLine.substring(0, 50)}${trimmedLine.length > 50 ? '...' : ''}`);
        }
    }

    if (validLines === 0 && content.trim() !== "") {
        console.error(`Error: No valid JSON objects were found in ${inputPath}.`);
        process.exit(1);
    }

    await Bun.write(outputPath, output);
    console.log(`Finished processing. Output saved to ${outputPath}`);
}

const inputPath = process.argv[2] || 'input.jsonl';

if (!inputPath.endsWith('.jsonl')) {
    console.error('Error: Input file must have a .jsonl extension.');
    process.exit(1);
}

const outputPath = inputPath.replace(/\.jsonl$/, '.md');

parseJsonl(inputPath, outputPath);
