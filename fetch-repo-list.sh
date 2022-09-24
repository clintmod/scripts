#!/usr/bin/env bash

set -e

echo
echo "Using current-dir as github org name"
echo
GITHUB_ORG=$(basename "$PWD")
gh repo list "$GITHUB_ORG" --limit 5000 | awk '{print $1}' | sed "s#$GITHUB_ORG/##" | sort > repo-list.txt && cat repo-list.txt
