#!/usr/bin/env bash

set -e

echo
echo "Creating socks4 proxy"
echo
ssh -g -f -N -D 50125 localhost
