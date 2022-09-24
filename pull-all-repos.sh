#!/usr/bin/env bash

set -e

ERROR=0
BATCH_SIZE=20
BATCHES=$(ls -d */ -1 | cut -f1 -d'/' | xargs -L $BATCH_SIZE)
IFS=$'\n'
for repos in $BATCHES; do
  echo "repos = $repos"
  IFS=$' '
  i=0
  for repo in $repos; do
    echo "repo = $repo"
    git -C "$repo" pull &
    pids[$i]=$!
  done
  wait "${pids[@]}"
done
echo
echo "Done"
echo
exit $ERROR
