#!/bin/bash

# Run 'gem list' and save the output to a file
gem list > gem_list.txt

# Create a Gemfile with the necessary format
echo "source 'https://rubygems.org'" > Gemfile

# Extract gem names and versions from the 'gem list' output and add them to the Gemfile
awk '{print "gem \x27" $1 "\x27, \x27" $2 "\x27"}' gem_list.txt >> Gemfile

# Clean up by removing the temporary file
rm gem_list.txt

echo "Gemfile generated successfully."
