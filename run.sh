#!/usr/bin/env bash
set -eu

#
# clone all repos from an org
#
# usage:
#   ./run.sh <gh-org-name> [directory]
#

org="${1-blarg}"
dir="${2-$(pwd)}"

repos=$(gh repo list "$org" --json nameWithOwner | jq -r .[].nameWithOwner)

for repo in $repos; do
  gh repo clone "$repo" "$dir/$repo"
done
