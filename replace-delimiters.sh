#!/bin/bash

# Go to source/content/posts directory
cd source/content/posts || exit

# Function to replace delimiters in a file
replace_delimiters() {
    local file="$1"
    perl -i -0777 -pe '
        # Re-escape already-escaped special characters in math environments
        s/(\$\$?|\[|\()\s*(.*?)\s*(\$\$?|\]|\))/
            $1 . ($2 =~ s{
                \\([_\{\};,])  # Find already escaped _, {, }, ;, or ,
            }{\\\\$1}gr) . $3/ges;

        # Always escape ampersand (&) inside math environments
        s/(\$\$?|\[|\()\s*(.*?)\s*(\$\$?|\]|\))/
            $1 . ($2 =~ s/&/\\&/gr) . $3/ges;

        # Ensure math delimiters are properly escaped
        s/(?<!\\)(\\[\(\[\$])/\\$1/g;
        s/(?<!\\)(\\[\)\]\$])/\\$1/g;

        # Remove spaces inside math environments
        s/(\$+)\s*(.*?)\s*(\$+)/$1$2$3/g;
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
