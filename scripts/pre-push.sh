#!/usr/bin/env bash

git stash -q --keep-index

flutter analyze

if [ $? -ne 0 ]; then
  git stash pop -q
  exit 1
fi

git stash pop -q
exit 0