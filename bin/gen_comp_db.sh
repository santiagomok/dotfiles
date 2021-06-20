#!/usr/bin/env bash

# Concatenate each compilation database entries  
# source: https://sarcasm.github.io/notes/dev/compilation-database.html#clang
# clang++ -MJ a.o.json -Wall -std=c++17 -o a.o -c a.cpp
# clang++ -MJ b.o.json -Wall -std=c++17 -o b.o -c b.cpp

# Insert the opening bracket: [
# Concatenate the entries
# Remove the trailing comma of the last entry (to be json compliant)
# Insert the closing bracket: ]
sed -e '1s/^/[\'$'\n''/' -e '$s/,$/\'$'\n'']/' $@ > compile_commands.json
