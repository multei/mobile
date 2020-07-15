#!/usr/bin/env bash
set -e

push_tag() {
    git fetch --tags
    VERSION_NAME=`bash scripts/generate_apk_version.sh`
    TAG_NAME=0.0.$VERSION_NAME
    git tag $TAG_NAME
    git push origin $TAG_NAME
}

fetch_tags() {
    git fetch --tags
}

fetch_tags
push_tag