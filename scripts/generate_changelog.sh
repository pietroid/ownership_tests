#!/bin/bash

# Usage: ./generate_changelog.sh <base_branch>
# Example: ./generate_changelog.sh main
BASE_BRANCH="${2:-main}"
HEAD_BRANCH="${1:-HEAD}"

git fetch origin "$BASE_BRANCH"
git fetch origin "$HEAD_BRANCH"

git log origin/"$BASE_BRANCH"..origin/"$HEAD_BRANCH" --pretty=format:"%s" \
    | grep -v -E '^(Release: |[Mm]erge)' \
    | sed 's/^/- /' > changelog.txt
    