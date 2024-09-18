#!/bin/bash

# Go to source/content/posts directory
cd source/content/posts || exit

# Function to replace delimiters in a file
replace_delimiters() {
    local file="$1"
    perl -i -0777 -pe '
        # Replace \( ... \) with \\( ... \\) while escaping and removing spaces after \( and before \)
        s/\\\(\s*(.*?)\s*\\\)/\\\\($1\\\\)/g;

        # Replace \[ ... \] with \\[ ... \\] while escaping and removing spaces after \[ and before \]
        s/\\\[\s*(.*?)\s*\\\]/\\\\[$1\\\\]/g;

        # Replace \{ with \\{ and \} with \\}
        s/\\\{/\\\\\{/g;
        s/\\\}/\\\\\}/g;
    ' "$file"
}

# Find all .md files and replace delimiters
find . -name "*.md" -print0 | while IFS= read -r -d '' file; do
    replace_delimiters "$file"
    echo "Processed: $file"
done

echo "Delimiter replacement completed."

# Return to the Hugo project root
cd ../.. || exit
