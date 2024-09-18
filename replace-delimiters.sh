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

        # 1. Escape underscores and asterisks: _ -> \_, * -> \*
        s/([_*])/\\$1/g;

        # 2. Handle (c), (r), (tm) -> add space before c, r, tm
        s/\((c|r|tm)\)/\( $1\)/g;

        # 3. Escape brackets, braces, and pipes: \( -> \\(, \[ -> \\[, etc.
        s/([\\[\\](){}|])/\\\\$1/g;

        # 4. Handle backslashes at the end of the line (replace "\\" at EOL with "\\\\")
        s/(^|[^\\])(\\\\)[[:blank:]]*$/\\1\\\\\\\\/g;

        # 5. Remove spaces after opening delimiters (\(, \[) and before closing delimiters (\), \])
        s/\\\\\(\s*(.*?)\s*\\\\\)/\\\\($1\\\\)/g;
        s/\\\\\[\s*(.*?)\s*\\\\\]/\\\\[$1\\\\]/g;

        # 6. Escape braces for LaTeX: \{ -> \\{, \} -> \\}
        s/\\\{/\\\\\{/g;
        s/\\\}/\\\\\}/g;

        # 7. Replace commas inside math expressions with \, (small space)
        s/([^\\])\\\((.*?)\\\)/$1\\\\($2\\\\)/g; # Look for commas in inline math expressions \( ... \)
        s/([^\\])\\\[\s*(.*?)\s*\\\]/$1\\\\[$2\\\\]/g; # Look for commas in block math expressions \[ ... \]

        # 8. Replace semicolons inside math expressions with \; (medium space)
        s/([^\\])\\\((.*?)\\\)/$1\\\\($2\\\\)/g; # Look for semicolons in inline math expressions \( ... \)
        s/([^\\])\\\[\s*(.*?)\s*\\\]/$1\\\\[$2\\\\]/g; # Look for semicolons in block math expressions \[ ... \
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
