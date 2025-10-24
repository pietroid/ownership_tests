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
sed -i.bak "s/^version:.*/version: $VERSION/" "$PUBSPEC_FILE"

echo "Updated pubspec.yaml to version $VERSION."