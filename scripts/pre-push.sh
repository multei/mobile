#!/usr/bin/env bash

git stash -q --keep-index

flutter analyze

git stash pop -q

if [ $? -ne 0 ]; then
  exit 1
fi

exit 0