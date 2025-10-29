#!/bin/bash

# Usage: ./generate_changelog.sh <base_branch> --tags=<true|false>
# Example: ./generate_changelog.sh main --tags=true
BASE_BRANCH="${2:-main}"
HEAD_BRANCH="${1:-HEAD}"
USE_TAGS="${3:-false}"

git fetch origin "$BASE_BRANCH"
git fetch origin "$HEAD_BRANCH"

if [ "$USE_TAGS" = "false" ]; then
    BASE_BRANCH_REF="origin/$BASE_BRANCH"
    HEAD_BRANCH_REF="origin/$HEAD_BRANCH"
else
    BASE_BRANCH_REF=$BASE_BRANCH
    HEAD_BRANCH_REF=$HEAD_BRANCH
fi

git log "$BASE_BRANCH_REF".."$HEAD_BRANCH_REF" --pretty=format:"%s" \
    | grep -v -E '^(Release: |[Mm]erge)' \
    | sed 's/^/- /' > changelog.txt
    