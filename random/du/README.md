# du

[2026-09-18_14-16-21_conv_4b4f2bd4_how_to_sort_a_conten.jsonl](2026-09-18_14-16-21_conv_4b4f2bd4_how_to_sort_a_conten.jsonl)

[2026-09-18_14-16-21_conv_4b4f2bd4_how_to_sort_a_conten.yml](2026-09-18_14-16-21_conv_4b4f2bd4_how_to_sort_a_conten.yml)


```

How to sort a content of a file system tree by size via `du` ?

How to sort a content of a file system tree by size via du ?
116 tokens
2.0s
59.04 tokens/s
Reasoning
Toggle content

The user wants to know how to sort the contents of a file system tree by size using the du command.
text

*   `du`: Estimates file space usage.
*   `-h`: Human-readable format (e.g., K, M, G).
*   `-s`: Summary (total size of each directory/file).
*   `-a`: All files (not just directories).
*   `-d` or `--max-depth`: Control the depth of the recursion.

*   `sort`: Sorts lines of text.
*   `-n`: Numerical sort.
*   `-h`: Human-numeric sort (handles K, M, G).
*   `-r`: Reverse (largest first).

*   *Scenario 1: Simple list of directories in the current folder.*
    `du -sh * | sort -h`
*   *Scenario 2: Nested structure (all subdirectories) sorted by size.*
    `du -h -d 1 | sort -h` (depth 1 means current folder's immediate children).
*   *Scenario 3: Largest items first (common use case).*
    `du -h -d 1 | sort -hr`
*   *Scenario 4: Handling "Human Readable" issues.*
    Sometimes `sort -h` isn't available on old systems (though it is standard on modern Linux/macOS). An alternative is to output in blocks/kilobytes and sort numerically.

*   **Method 1: The Standard/Modern Way (Human Readable)**
    *   `du -h --max-depth=1 | sort -hr`
    *   Explain each flag.

*   **Method 2: The "Old School" / More Precise Way (Kilobytes)**
    *   `du -k | sort -nr`
    *   Why? Because `sort -h` is sometimes missing and `du -k` is very consistent.

*   **Method 3: Specific File/Directory filtering**
    *   `du -sh ./* | sort -h`

*   *Correction:* `du` output often includes the path. `sort` handles this fine, but if the path has numbers in it, it might get weird. However, `sort -h` usually handles the first column correctly.
*   *Tip:* Mention `ncdu` as a better interactive alternative.

*   Start with the most common command.
*   Break down the flags.
*   Provide variations (depth, largest first).
*   Mention `ncdu`.

To sort the contents of a directory by size using the du (disk usage) command, the best approach depends on whether you want "human-readable" output (like 1K, 2M, 1G) or raw numbers.

Here are the most common ways to do it:
1. The Standard Way (Human Readable)

This is the most common command to see the sizes of all items in the current directory, sorted from largest to smallest:
bash

du -h --max-depth=1 | sort -hr

Breakdown of the flags:

    du: Disk Usage command.
    -h: Human-readable (e.g., 1K, 234M, 2G).
    --max-depth=1: Only shows the folders in the current directory (prevents listing every single sub-folder inside those folders). Note: On macOS/BSD, use -d 1 instead.
    |: The "pipe" sends the output of du to the next command.
    sort: The sorting tool.
    -h: Human-numeric sort (crucial! This tells sort to understand that 1G is bigger than 2M).
    -r: Reverse (puts the largest files at the top).

2. The "Old School" Way (Most Reliable)

If your version of sort doesn't support the -h flag (common on some older Linux distros), use kilobytes instead. This is often faster and more consistent:
bash

du -k --max-depth=1 | sort -nr

Breakdown of the flags:

    -k: Forces du to show sizes in Kilobytes.
    -n: Performs a standard numerical sort.
    -r: Reverse (largest first).

3. Sorting Only Specific Files/Folders

If you want to see the size of every file and folder inside the current directory (not just the immediate children), use the * wildcard:
bash

du -sh * | sort -hr

    -s: Summary (prevents du from listing every sub-folder individually).
    *: Targets everything in the current folder.

Summary Table: Which one should I use?
Goal 	Command
Standard (Best for most) 	`du -h --max-depth=1
macOS / BSD version 	`du -h -d 1
Old Linux systems 	`du -k --max-depth=1
Specific items only 	`du -sh *
Pro Tip: Try ncdu

If you find yourself doing this often, I highly recommend installing ncdu. It is an interactive disk usage analyzer. It scans your directory and lets you navigate through folders using arrow keys to see what is taking up space.

    To install: sudo apt install ncdu (Ubuntu/Debian) or brew install ncdu (macOS).
    To use: Just type ncdu in any directory.

models/gemma-4 12B Q8_0 it
1,326 tokens
3min 18s
6.67 t/s
Open command picker
Open prompt picker
Open file mention picker
Add files, prompts, tools or MCP Servers
gemma-4 12B it
Send
Chat - llama-ui

```
