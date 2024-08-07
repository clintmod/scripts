#!/usr/bin/env bash

set -e
while true; do
    now=$(date '+%Y.%m.%d %H:%M:%S')
    if curl -L https://jenkins.vectorscape.com 2>&1 | grep "SSL certificate problem"; then
        echo
        echo "$now Disabling Zscaler Internet Security"
        echo
        ./zscaler-disable-internet-security.applescript
    else
        echo "$now Internet is secure"
    fi
    sleep 2
done
