#!/bin/bash
VERSION_FILE="../version.txt"

if [[ ! -f "$VERSION_FILE" ]]; then
    echo "version.txt not found!"
    exit 1
fi

# Read current version
current_version=$(cat "$VERSION_FILE")

# Parse version components for format YY.MM.DD-patch
IFS='.-+' read -r yy mm dd patch code <<< "$current_version"

today_yy=$(date +"%y")
today_mm=$(date +"%m")
today_dd=$(date +"%d")

if [[ "$yy" == "$today_yy" && "$mm" == "$today_mm" && "$dd" == "$today_dd" ]]; then
    # Same day, bump patch
    new_patch=$((patch + 1))
else
    # New day, reset patch
    new_patch=0
fi

if [[ -z "$code" ]]; then
    new_code=1
else
    new_code=$((code + 1))
fi

new_version="${today_yy}.${today_mm}.${today_dd}-${new_patch}+${new_code}"
echo "$new_version" > "$VERSION_FILE"