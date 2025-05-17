#!/bin/bash

# Get today's date in YYYY-MM-DD format
today=$(date '+%Y-%m-%d')

# Set log file name
filename="logs/daily-${today}.md"

# Only create the file if it doesn't already exist
if [ ! -f "$filename" ]; then
  mkdir -p logs
  echo -e "# Daily Log – ${today}\n\n## Tasks\n\n## Notes\n\n## Reflections\n" > "$filename"
  echo "✅ Created $filename"
else
  echo "⚠️ $filename already exists."
fi
