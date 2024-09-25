#!/bin/bash

# Go to source/content/posts directory
cd source/content/posts || exit

# Function to replace delimiters in a file
replace_delimiters() {
    local file="$1"
    perl -i -0777 -pe '
        # Helper function to escape special characters if not already escaped
        sub escape_if_not_escaped {
            my ($char) = @_;
            return "(?<!\\\\)$char(?!\\\\)";
        }

        # Escape special characters in all math environments
        foreach my $env (qw(\\\( \\\[ \$ \$\$)) {
            my $end_env = $env eq '\\\(' ? '\\\)' : ($env eq '\\\[' ? '\\\]' : $env);
            s/${env}((?:(?!${end_env}).)*?)${end_env}/$env . $1 =~ s{
                @{[escape_if_not_escaped("_")]}|
                @{[escape_if_not_escaped("&")]}|
                @{[escape_if_not_escaped("\{")]}|
                @{[escape_if_not_escaped("\}")]}|
                @{[escape_if_not_escaped("\,")]}|
                @{[escape_if_not_escaped("\;")]}
            }{\\$&}gr . $end_env/ges;
        }

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
