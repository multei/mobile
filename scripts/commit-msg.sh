#!/usr/bin/env bash

commit_regex='^((build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test|Publish)(\([a-zA-Z0-9 /_,.-]+?\))?: .{1,59}\w (\([A-Z]+-[0-9]+\)|\(#[0-9]+\)|\[skip ci\]|\[ci\])|Merge branch .+|(fixup|squash)! .+|WIP: .+)$'

error_msg='
.git/hooks/commit-msg: Aborting commit, try again with a valid message. The regexp checks for:

* a conventional commit message subject (to be parsed into changelogs, see https://www.conventionalcommits.org/en/v1.0.0 ):
   - a change type, either of "build", "chore", "ci", "docs", "feat", "fix", "perf", "refactor", "revert", "style", "test" or "Publish"
   - optionally, in parenthesis, subsystem(s) affected by the change (comma delimited list)
   - a colon, space (": ") and a brief subject (60 characters maximum) not ending with a period
   - a space and in parenthesis, an issue id " (FOO-123)" or " (#123)"... or the tags "[skip ci]" or "[ci]" (do we use these?)
* ... or, a Git autosquash line, i.e. "fixup! My previous commit" or "squash! Another previous commit" (see https://thoughtbot.com/blog/autosquashing-git-commits )
* ... or, a merge commit "Merge branch x..."
* ... or, a work-in-progress tag "WIP: "
* optionally (not validated), two line breaks and a commit message body
This script is written by CJ Sveningsson (carl-johan.sveningsson@scania.com), inspired by https://gist.github.com/pgilad/5d7e4db725a906bd7aa7 (Gilad Peleg)'

if ! grep -iqE "${commit_regex}" "$1"; then
    echo "${error_msg}" >&2
    exit 1
fi
