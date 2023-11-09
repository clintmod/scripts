#!/usr/bin/env bash

# set -e

brew install duti yq
curl "https://raw.githubusercontent.com/github/linguist/master/lib/linguist/languages.yml" \
  | yq -r "to_entries | (map(.value.extensions) | flatten) - [null] | unique | .[]" \
  | xargs -L 1 -I "{}" duti -s com.microsoft.VSCode {} all



# Use duti to set defaults for specific files to VSCode
duti -s com.microsoft.VSCode public.plain-text all
duti -s com.microsoft.VSCode public.source-code all
duti -s com.microsoft.VSCode public.data all
duti -s com.microsoft.VSCode .css all
duti -s com.microsoft.VSCode .gitattributes all
duti -s com.microsoft.VSCode .gitignore all
duti -s com.microsoft.VSCode .htaccess all
duti -s com.microsoft.VSCode .js all
duti -s com.microsoft.VSCode .json all
duti -s com.microsoft.VSCode .link all
duti -s com.microsoft.VSCode .md all
duti -s com.microsoft.VSCode .mv all
duti -s com.microsoft.VSCode .mvt all
duti -s com.microsoft.VSCode .scss all
duti -s com.microsoft.VSCode .sh all
duti -s com.microsoft.VSCode .txt all
duti -s com.microsoft.VSCode .xml all
duti -s com.microsoft.VSCode .yaml all
duti -s com.microsoft.VSCode .zsh all
