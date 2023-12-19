#!/usr/bin/env bash

set -e

if [[ -z $URL ]]; then
    echo "Error: Expected URL to be set"
    exit 1
fi

if [[ -z $INTERVAL ]]; then
    echo "Error: Expected INTERVAL to be set"
    exit 1
fi

while true; do
    osascript chrome-reload.scpt $URL
    sleep $INTERVAL
done
