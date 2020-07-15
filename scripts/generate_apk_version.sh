#!/bin/bash

git fetch
git tag --list | cut -d . -f 3 | sort -rn | head -n 1 | xargs expr 1 +