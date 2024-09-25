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

            # Escape double backslashes
            $content =~ s/\\\\/\\\\\\\\/g;

            # Only escape \begin and \end if they are not already escaped
            $content =~ s/(?<!\\\\)\\begin/\\\\begin/g;
            $content =~ s/(?<!\\\\)\\end/\\\\end/g;

            # Escape underscores if not already escaped
            $content =~ s/(?<!\\)_/\\_/g;

            # Only double-escape curly braces if they are already escaped
            $content =~ s/(?<!\\)\\{\\\\{/g;
            $content =~ s/(?<!\\)\\}/\\\\}/g;

            # Only double-escape commas if they are already escaped
            $content =~ s/(?<!\\)\\,/\\\\,/g;

            return $content;
        }

        # Function to process \text{} environments and escape underscores within them
        sub process_text {
            my ($content) = @_;

            # Escape underscores if not already escaped inside \text{}
            $content =~ s/(?<!\\)_/\\_/g;

            return $content;
        }
        # Process math environments: \( ... \), \[ ... \], $ ... $, and $$ ... $$
        # This version allows for any amount of whitespace, including newlines, between delimiters
        s/(\\\(|\\\[|\$\$?)\s*(.*?)\s*(\\\)|\\\]|\$\$?)/ 
            my ($open, $content, $close) = ($1, $2, $3);
            $open . process_math($content) . $close;
        /gsex;

        # Process \text{...} environments and escape underscores inside them
        s/\\text\{(.*?)\}/ 
            "\\text{" . process_text($1) . "}";
        /gse;

        # Escape delimiters consistently
        s/(\\\(|\\\[)/\\$1/g;
        s/(\\\)|\\\])/\\$1/g;
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