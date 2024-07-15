#!/bin/bash

# Get the directory path from the first argument
directory=$1

# Find all files, excluding git-related and binary files
find "$directory" -type f -not -path '*\.git*' -not -path '*.git*' -not -name '*~*' -not -name '*.*' | while read file; do
  # Create a header with the filename
  echo "---"
  echo "name: $(basename "$file")"

  # Print the contents of the file
  cat "$file"

  # Create a footer
  echo "---"
done > all_files.txt

echo "All files concatenated into"
