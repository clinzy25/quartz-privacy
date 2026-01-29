
SOURCE="/home/conner/Documents/obsidian/Personal/Privacy Docs"
DEST="/home/conner/Documents/quartz-privacy/content"

# Remove existing content
rm -rf "$DEST"

# Copy the directory contents
cp -r "$SOURCE" "$DEST"

echo "Content copied successfully"