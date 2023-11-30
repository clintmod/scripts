#!/usr/bin/env bash

fish --profile-startup /tmp/startup.prof -c exit

sort -nk2 /tmp/startup.prof
