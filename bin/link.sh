#!/usr/bin/env bash

[[ -f $HOME/.local/bin/color.sh ]] && source $HOME/.local/bin/color.sh

function _link_to() {
    local target
    local link_name
    target=$1
    link_name=$2
    # echo "link_to" $1 $2
    [[ -h $link_name ]] && rm -vf $link_name && echo -e "${GREEN}  |___ link removed ... OK${NC}" 
    [[ ! -h $link_name ]] && ln -svf $target $link_name && echo -e "${GREEN}  |___ link ... OK${NC}"
}

