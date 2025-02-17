#!/bin/bash

echo "Checking for empty string values in JSON files..."

# If no JSON files were passed, exit successfully
if [ "$#" -eq 0 ]; then
    exit 0
fi

# Loop over each JSON file passed by pre-commit
for file in "$@"; do
    if grep -q ': *""' "$file"; then
        echo "❌ Commit blocked: Found empty string values in $file"
        exit 1
    fi
done

echo "✅ No empty string values found. Proceeding with commit."
exit 0
