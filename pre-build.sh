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

            # Double-escape commas
            $content =~ s/\\,/\\\\,/g;

            # Double-escape apostrophes (single quotes)
            $content =~ s/(?<!\\\\)\\'/\\\\'/g;

            # Double-escape underscores
            $content =~ s/\\_/\\\\_/g;

            # Only escape rendered curly brackets
            $content =~ s/\\left\\\{/\\left\\\\\{/g;
            $content =~ s/\\right\\\}/\\right\\\\\}/g;

            return $content;
        }

        # Function to process \text{} environments and escape underscores within them
        sub process_text {
            my ($content) = @_;

            # Escape underscores inside \text{}
            $content =~ s/_/\\_/g;

            return $content;
        }

        # Function to escape \% and \$ outside of math environments
        sub escape_outside_math {
            my ($text) = @_;

            # Match anything outside of math environments and escape \% and \$
            $text =~ s{
                # Match content outside of math delimiters (\( \) \[ \] or $ ... $ or $$ ... $$)
                (?:(?!\\\(|\\\)|\\\[|\\\]|\$|\$\$).)+
            }{
                # Escape \% and \$ in this part of the text
                my $non_math_content = $&;
                $non_math_content =~ s/(?<!\\\\)\\\%/\\\\\%/g;
                $non_math_content =~ s/(?<!\\\\)\\\$/\\\\\$/g;
                $non_math_content;
            }gsex;

            return $text;
        }

        # Escape \% and \$ outside of math environments
        $_ = escape_outside_math($_);

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

        # # Double-escape delimiters if not already double-escaped
        s/(?<!\\\\)\\\(/\\\\\(/g;   # Escape \( to \\(
        s/(?<!\\\\)\\\)/\\\\\)/g;   # Escape \) to \\)
        s/(?<!\\\\)\\\[/\\\\\[/g;   # Escape \[ to \\[
        s/(?<!\\\\)\\\]/\\\\\]/g;   # Escape \] to \\]
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