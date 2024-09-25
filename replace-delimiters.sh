#!/bin/bash

# Go to source/content/posts directory
cd source/content/posts || exit

# Function to replace delimiters in a file
replace_delimiters() {
    local file="$1"
    perl -i -0777 -pe '
        # Helper function to process math content
        sub process_math {
            my ($content) = @_;
            $content =~ s/\\_/\\\\_/g;  # Escape already escaped underscores
            $content =~ s/\\\\/\\\\\\\\/g;  # Escape double backslashes
            return $content;
        }

        # Replace \begin with \\begin and \end with \\end
        s/\\\begin/\\\\begin/g;
        s/\\\end/\\\\end/g;

        # Process math environments: \( ... \), \[ ... \], $ ... $, and $$ ... $$
        s/(\\\(|\\\[|\$\$?)\s*(.*?)\s*(\\\)|\\\]|\$\$?)/
            my ($open, $content, $close) = ($1, $2, $3);
            $open . process_math($content) . $close;
        /ges;

        # Escape delimiters consistently
        s/(\\\(|\\\[)/\\$1/g;
        s/(\\\)|\\\])/\\$1/g;

        # Replace \{ with \\{ and \} with \\}
        s/\\\{/\\\\\{/g;
        s/\\\}/\\\\\}/g;

        # Replace \, with \\, and \; with \\;
        s/\\\,/\\\\,/g;
        s/\\\;/\\\\;/g;
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