#!/usr/bin/env bash

source normalize_path.sh

BIN_NAME=$(basename "$0")
COMMAND_NAME=$1

# Reference: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself/246128#246128
SCRIPT_PATH=$( greadlink -f ${BASH_SOURCE[0]} || readlink -f ${BASH_SOURCE[0]} )
# echo $SCRIPT_PATH

SCRIPT_DIR=$(dirname $SCRIPT_PATH)
QUARTUS_SCRIPT_DIR=$(normalize_path ${SCRIPT_DIR}/../quartus)

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

function _link_to() {
    local target
    local link_name
    target=$1
    link_name=$2
    # echo "link_to" $1 $2
    [[ -h $link_name ]] && rm -vf $link_name && echo -e "  |___ link removed ... OK" 
    [[ ! -h $link_name ]] && ln -svf $target $link_name && echo -e "  |___ link ... OK"
}

sub_help () {
    echo -e "Usage: ${YELLOW}${SCRIPT_DIR}/$BIN_NAME <command> [name]${NC}"
    echo
    echo "Commands:"
    echo "  help            This help message"
    echo "  path            Print paths" 
    echo "  make            Link [name] to <QUARTUS_SCRIPT_DIR>/makefile.gmake"
    echo
}

sub_path () {
    echo "Paths:"
    echo "  SCRIPT                    $SCRIPT_DIR"
    echo "  QUARTUS_SCRIPT            ${QUARTUS_SCRIPT_DIR}"
    echo 
}

sub_make () {
    _link_to ${QUARTUS_SCRIPT_DIR}/makefile.gmake $@
}

case $COMMAND_NAME in
    "" | "-h" | "--help")
        sub_help
        ;;
    *)
        shift
        sub_${COMMAND_NAME} $@
        if [ $? = 127 ]; then
            echo -e "${RED} Error: '$COMMAND_NAME' is not a known command or has errors.${NC}" >&2
            sub_help
            exit 1
        fi
        ;;
esac
