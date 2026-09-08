const fs = require('fs');

function cleanNixHelp() {
    const inputFile = 'help.md';
    const outputFile = 'cleaned_help.md';
    let content = '';

    try {
        content = fs.readFileSync(inputFile, 'utf8');
    } catch (err) {
        console.error("Error: Could not find help.md");
        return;
    }

    // 1. Define the Regular Expressions
    const ansiEscape = /\x1B\[[0-9;]*[mGK]/g;
    const oscHyperlink = /\x1B\]8;;.*?\x1B\\/g;
    const leadingBar = /^\s*│\s?/;
    const escapedUnderscore = /\\+_/g;
    // New regex to match the custom dot bullets (·)
    const customBullet = /^\s*·\s?/;

    // Step 1: Global removal of ANSI and Hyperlinks
    let cleanedText = content.replace(ansiEscape, '').replace(oscHyperlink, '');

    // Step 2: Process lines for Markdown blocks and Lists
    const lines = cleanedText.split(/\r?\n/);
    const finalLines = [];
    let isInBlock = false;

    for (let line of lines) {
        if (leadingBar.test(line)) {
            if (!isInBlock) {
                finalLines.push("```bash");
                isInBlock = true;
            }
            const cleanLine = line.replace(leadingBar, '');
            finalLines.push(cleanLine);
        } else {
            if (isInBlock) {
                finalLines.push("```");
                isInBlock = false;
            }
            
            // FIX: Convert custom middle-dot bullets (·) to standard Markdown bullets (-)
            if (customBullet.test(line)) {
                line = line.replace(customBullet, '- ');
            }
            
            finalLines.push(line);
        }
    }

    if (isInBlock) {
        finalLines.push("```");
    }

    // Step 3: Join and perform final global underscore cleanup
    let finalResult = finalLines.join('\n');
    finalResult = finalResult.replace(escapedUnderscore, '\_');

    fs.writeFileSync(outputFile, finalResult + '\n', 'utf8');
    console.log("Successfully created cleaned\_help.md");
}

cleanNixHelp();

