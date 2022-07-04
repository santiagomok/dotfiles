#!/usr/bin/env bash
# ------------------------------------------------------------------------------ 
# File: run.sh
# Usage: run.sh <command>
# 
# Reference: https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself/246128#246128
# ------------------------------------------------------------------------------ 

BIN_NAME=$(basename "$0")
COMMAND_NAME=$1

SCRIPT_PATH=$( greadlink -f ${BASH_SOURCE[0]} || readlink -f ${BASH_SOURCE[0]} )
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

source ${SCRIPT_DIR}/color.sh

sub_help () {
    echo -e "Usage: ${YELLOW}$BIN_NAME <command>${NC}"
    echo
    echo "Commands:"
    echo "  help            This help message"
    echo "  color           Show foreground and background colors" 
    echo "  palette         Show color palette" 
    echo "  link            Link shell script to $HOME/local/bin" 
    echo 
    echo "Paths:"
    echo "  SCRIPT_DIR"     $SCRIPT_DIR
    echo
}

# ------------------------------------------------------------------------------ 
sub_palette() {

    echo "---------------------------------------------------"
    echo "COLOR PALETTE:"
    for i in {0..255}; do  
        printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ; 
        if ! (( ($i + 1 ) % 8 )); then 
            echo ; 
        fi ;
    done
}

# ------------------------------------------------------------------------------ 
sub_color () {
echo "FOREGROUND COLORS:"	
    for color in "${!FOREGROUND_COLORS[@]}"; do
        echo -ne "${FOREGROUND_COLORS[$color]}${color}${NC}";
        echo " | ${FOREGROUND_COLORS[$color]}";
    done

    echo "---------------------------------------------------"
    echo "BACKGROUND COLORS:"	
    for color in "${!BACKGROUND_COLORS[@]}"; do
        echo -ne "${BACKGROUND_COLORS[$color]}${color}${NC}";
        echo " | ${BACKGROUND_COLORS[$color]}";
    done
}

sub_link() {
   ln -svf ${SCRIPT_DIR}/color.sh 		$HOME/local/bin/color.sh 
   ln -svf ${SCRIPT_DIR}/link.sh 		$HOME/local/bin/link.sh
   ln -svf ${SCRIPT_DIR}/normalize_path.sh 	$HOME/local/bin/normalize_path.sh
}

# ------------------------------------------------------------------------------ 
case $COMMAND_NAME in
    "" | "-h" | "--help")
        sub_help
        ;;
    *)
        shift
        sub_${COMMAND_NAME} $@
        if [ $? = 127 ]; then
            echo -e "${RED} Error: '$COMMAND_NAME' is an unknown command or has errors.${NC}" >&2
            sub_help
            exit 1
        fi
        ;;
esac
