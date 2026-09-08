import re

# Regular expressions for ANSI escape codes and OSC hyperlinks
ansi_escape = re.compile(r'\x1B\[[0-9;]*[mGK]')
osc_hyperlink = re.compile(r'\x1B\]8;;.*?\x1B\\')

with open('help.md', 'r', encoding='utf-8') as f:
    content = f.read()

# Remove the codes
content = ansi_escape.sub('', content)
content = osc_hyperlink.sub('', content)

with open('cleaned_help.md', 'w', encoding='utf-8') as f:
    f.write(content)

