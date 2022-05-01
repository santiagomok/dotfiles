#!/usr/bin/env bash
#
# Usage: normalize_path PATH
#
# Remove /./ and dir/.. sequences from a pathname and write result to stdout.
#
# Reference: https://www.linuxjournal.com/content/normalizing-path-names-bash

function normalize_path()
{
    # Remove all /./ sequences.
    local   path=${1//\/.\//\/}
    
    # Remove dir/.. sequences.
    while [[ $path =~ ([^/][^/]*/\.\./) ]]
    do
        path=${path/${BASH_REMATCH[0]}/}
    done
    echo $path
}

# if [[ $(basename $0 .sh) == 'normalize_path' ]]; then
    # if [[ "$*" ]]; then
        # for p in "$@"
        # do
            # printf "%-30s => %s\n" $p $(normalize_path $p)
        # done
    # else
        # for p in /test/../test/file test/../test/file .././test/../test/file
        # do
            # printf "%-30s => %s\n" $p $(normalize_path $p)
        # done
    # fi
# fi
