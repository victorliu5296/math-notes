#!/bin/bash

# Go to source/content/posts directory
cd source/content/posts || exit

# Function to replace delimiters in a file
replace_delimiters() {
    local file="$1"
    perl -i -0777 -pe '
        # Replace \begin with \\begin and \end with \\end
        s/\\\begin/\\\\begin/g;
        s/\\\end/\\\\end/g;

        # Escape underscores ONLY within LaTeX math expressions: \( ... \) and \[ ... \]
        # Use non-greedy match to capture math content and avoid breaking non-math content
        s/(\\\(|\\\[)([^\)]*?)(_)([^\)]*?)(\\\)|\\\])/\1\2\\_\4\5/g;

        # Replace \( ... \) with \\( ... \\), skipping if already escaped as \\( ... \\)
        s/(?<!\\)\\\(\s*(.*?)\s*(?<!\\)\\\)/\\\\($1\\\\)/g;

        # Replace \[ ... \] with \\[ ... \\], skipping if already escaped as \\[ ... \\]
        s/(?<!\\)\\\[\s*(.*?)\s*(?<!\\)\\\]/\\\\[$1\\\\]/g;

        # Remove spaces inside inline math $ ... $
        s/\$\s*(.*?)\s*\$/\$$1\$/g;

        # Remove spaces inside block math $$ ... $$
        s/\$\$\s*(.*?)\s*\$\$/\$\$$1\$\$/g;

        # Replace \{ with \\{ and \} with \\}
        s/\\\{/\\\\\{/g;
        s/\\\}/\\\\\}/g;

        # Replace \, with \\, and \; with \\;
        s/\\\,/\\\\\\,/g;
        s/\\\;/\\\\\\;/g;
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
