#!/usr/bin/env bash

for branch in $(git branch -r --merged origin/master | fgrep -v '*' | grep -v master | grep -v develop | grep -v staging | grep -v release | sed 's#origin/##'); do
    git push origin :$branch --no-verify
done
