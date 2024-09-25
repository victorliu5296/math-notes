#!/bin/bash

# Go to source/content/posts directory
cd source/content/posts || exit

# Function to replace delimiters and escape special characters in a file
replace_delimiters() {
    local file="$1"
    perl -i -0777 -pe '
        # Step 1: Escape special characters within math environments

        # Replace \begin with \\begin and \end with \\end
        s/\\begin/\\\\begin/g;
        s/\\end/\\\\end/g;

        # Escape underscores, ampersands, braces, commas, and semicolons ONLY within LaTeX math expressions
        # Handles \( ... \), \[ ... \], $...$, and $$...$$ consistently

        # Inline math \( ... \) and block math \[ ... \]
        s/(\\\(|\\\[)(.*?)(\\\)|\\\])/escape_math($1, $2, $3)/eg;

        # Inline math $...$
        s/\$(.*?)\$/escape_math("\$", $1, "\$")/eg;

        # Block math $$...$$
        s/\$\$(.*?)\$\$/escape_math("\$\$", $1, "\$\$")/eg;

        # Step 2: Ensure consistent escaping for non-math characters outside math environments

        # Replace \{ with \\{ and \} with \\}
        s/\\\{/\\\\\{/g;
        s/\\\}/\\\\\}/g;

        # Replace \, with \\, and \; with \\;
        s/\\\,/\\\\\\,/g;
        s/\\\;/\\\\\\;/g;

        # Return the string unchanged outside math environments
        sub escape_math {
            my ($start, $content, $end) = @_;
            
            # Escape underscores
            $content =~ s/_/\\_/g;

            # Escape ampersands (&) to avoid alignment issues
            $content =~ s/&/\\&/g;

            # Return the escaped math environment
            return "$start$content$end";
        }

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
