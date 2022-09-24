#!/usr/bin/env bash

set -e

# Clone all repos from a GitHub organization

echo
echo "Using current-dir as github org name"
echo
GITHUB_ORG=$(basename "$PWD")
ERROR=0
BATCH_SIZE=20
BATCHES=$(cat repo-list.txt | xargs -L $BATCH_SIZE)
IFS=$'\n'
for repos in $BATCHES; do
  echo "repos = $repos"
  IFS=$' '
  i=0
  for repo in $repos; do
    echo "repo = $repo"
    gh repo clone "$GITHUB_ORG/$repo" "$repo" || true &
    pids[$i]=$!
  done
  wait "${pids[@]}"
done
echo
echo "Done"
echo
exit $ERROR
