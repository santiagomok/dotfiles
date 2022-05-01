#!/usr/bin/env bash

SCRIPT_PATH=$( greadlink -f ${BASH_SOURCE[0]} || readlink -f ${BASH_SOURCE[0]} )
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

source ${SCRIPT_DIR}/color.sh

RED=${FOREGROUND_COLORS[RED]}
GREEN=${FOREGROUND_COLORS[GREEN]}

function _link_to() {
    local target
    local link_name
    target=$1
    link_name=$2
    # echo "link_to" $1 $2
    [[ -h $link_name ]] && rm -vf $link_name && echo -e "${GREEN}  |___ link removed ... OK${NC}" 
    [[ ! -h $link_name ]] && ln -svf $target $link_name && echo -e "${GREEN}  |___ link ... OK${NC}"
}

