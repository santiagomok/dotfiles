#!/usr/bin/env bash
# ------------------------------------------------------------------------------ 
# File: color.sh
# Usage: color.sh print
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 
# Color Table
NC='\033[0m'
declare -A FOREGROUND_COLORS
FOREGROUND_COLORS=(
    ['DEFAULT']='\033[0;39m'
    ['BLACK']='\033[0;30m' 
	['WHITE']='\033[0;97m'	
    ['RED']='\033[0;31m' 
    ['BLUE']='\033[0;34m'
    ['GREEN']='\033[0;32m'
	['CYAN']='\033[0;36m'	
    ['YELLOW']='\033[0;33m'
    ['MAGENTA']='\033[0;34m'	
	['DARK GRAY']='\033[0;90m'	
	['LIGHT GRAY']='\033[0;37m'	
	['LIGHT RED']='\033[0;91m'
	['LIGHT GREEN']='\033[0;92m'
	['LIGHT BLUE']='\033[0;94m'	
	['LIGHT YELLOW']='\033[0;93m'	
	['LIGHT MAGENTA']='\033[0;95m'	
	['LIGHT CYAN']='\033[0;96m'	
)

declare -A BACKGROUND_COLORS
BACKGROUND_COLORS=(
 	[ 'default' ]='\033[0;97m'	
 	[ 'black' ]='\033[0;40m'	
 	[ 'white' ]='\033[0;107m'	
 	[ 'red' ]='\033[0;41m'	
 	[ 'green' ]='\033[0;42m'	
 	[ 'blue' ]='\033[0;44m'	
 	[ 'cyan' ]='\033[0;46m'	
 	[ 'yellow' ]='\033[0;43m'	
 	[ 'magenta' ]='\033[0;45m'	
 	[ 'dark gray' ]='\033[0;100m'	
 	[ 'light gray' ]='\033[0;47m'	
 	[ 'light red' ]='\033[0;101m'	
 	[ 'light green' ]='\033[0;102m'	
 	[ 'light blue' ]='\033[0;104m'	
 	[ 'light cyan' ]='\033[0;106m'	
 	[ 'light yellow' ]='\033[0;103m'	
 	[ 'light magenta' ]='\033[0;105m'	
)

sub_demo () {
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

BIN_NAME=$(basename "$0")
COMMAND_NAME=$1

SCRIPT_PATH=$( greadlink -f ${BASH_SOURCE[0]} || readlink -f ${BASH_SOURCE[0]} )
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

sub_help () {
    echo -e "Usage: ${FOREGROUND_COLORS[YELLOW]}${SCRIPT_DIR}/$BIN_NAME <command>${NC}"
    echo
    echo "Commands:"
    echo "  help            This help message"
    echo "  demo            Show foreground and background colors" 
    echo "  palette         Show color palette" 
    echo
}

case $COMMAND_NAME in
    "" | "-h" | "--help")
        sub_help
        ;;
    *)
        shift
        sub_${COMMAND_NAME} $@
        if [ $? = 127 ]; then
            echo -e "${FOREGROUND_COLORS[RED]} Error: '$COMMAND_NAME' is not a known command or has errors.${NC}" >&2
            sub_help
            exit 1
        fi
        ;;
esac
