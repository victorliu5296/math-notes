#!/bin/bash

# Function to replace delimiters in a file
replace_delimiters() {
    local file="$1"
    perl -i -pe '
        # Replace \( expression \) with $`expression`$
        s/\\\(\s*/\$`/g;
        s/\s*\\\)/`\$/g;
        # Replace \[ expression \] with ```math expression ```
        s/\\\[\s*/```math /g;
        s/\s*\\\]/ ```/g;
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
