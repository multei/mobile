#!/usr/bin/env bash
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACMR "*.dart" | sed 's| |\\ |g')

[ -z "$STAGED_FILES" ] && exit 0

echo Formatting "$STAGED_FILES"

echo "$STAGED_FILES" | xargs flutter format

echo "$STAGED_FILES" | xargs git add

exit 0
