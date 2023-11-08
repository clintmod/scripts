#!/usr/bin/env bash

set -e


echo
echo "Opening port to jz41fz@192.168.1.48"
echo
ssh -f -N -R 50125:localhost:50125 jz41fz@192.168.1.48 || true
echo
echo "Opening port to jz41fz@192.168.1.69"
echo
ssh -f -N -R 50125:localhost:50125 jz41fz@192.168.1.69 || true
