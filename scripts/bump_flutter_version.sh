#!/bin/bash

# Paths
VERSION_FILE="../version.txt"
PUBSPEC_FILE="../pubspec.yaml"

# Check if version.txt exists
if [ ! -f "$VERSION_FILE" ]; then
    echo "Error: $VERSION_FILE not found."
    exit 1
fi

# Read version from version.txt
VERSION=$(cat "$VERSION_FILE" | tr -d '[:space:]')

# Update version in pubspec.yaml
if grep -q "^version:" "$PUBSPEC_FILE"; then
    # Replace existing version line
    sed -i "" "s/^version:.*/version: $VERSION/" "$PUBSPEC_FILE"
else
    # Add version line at the top
    sed -i "" "1s/^/version: $VERSION\n/" "$PUBSPEC_FILE"
fi

echo "Updated pubspec.yaml to version $VERSION."