#!/usr/bin/env bash
# ------------------------------------------------------------------------------ 
# File: color.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 
# Color Table
NC='\033[0m'
declare -A FOREGROUND_COLORS
FOREGROUND_COLORS=(
    ['DEFAULT']='\033[0;39m'
    ['BLACK']='\033[0;30m' 
    ['RED']='\033[0;31m' 
    ['GREEN']='\033[0;32m'
    ['YELLOW']='\033[0;33m'
    ['BLUE']='\033[0;34m'
    ['Magenta']='\033[0;34m'	
	['Cyan']='\033[0;36m'	
	['Light gray']='\033[0;37m'	
	['Dark gray']='\033[0;90m'	
	['Light red']='\033[0;91m'
	['Light green']='\033[0;92m'
	['Light yellow']='\033[0;93m'	
	['Light blue']='\033[0;94m'	
	['Light magenta']='\033[0;95m'	
	['Light cyan']='\033[0;96m'	
	['White']='\033[0;97m'	
)

declare -A BACKGROUND_COLORS
BACKGROUND_COLORS=(
 	[ 'Default background color' ]='\033[0;97m'	
 	[ 'Black' ]='\033[0;40m'	
 	[ 'Red' ]='\033[0;41m'	
 	[ 'Green' ]='\033[0;42m'	
 	[ 'Yellow' ]='\033[0;43m'	
 	[ 'Blue' ]='\033[0;44m'	
 	[ 'Magenta' ]='\033[0;45m'	
 	[ 'Cyan' ]='\033[0;46m'	
 	[ 'Light gray' ]='\033[0;47m'	
 	[ 'Dark gray' ]='\033[0;100m'	
 	[ 'Light red' ]='\033[0;101m'	
 	[ 'Light green' ]='\033[0;102m'	
 	[ 'Light yellow' ]='\033[0;103m'	
 	[ 'Light blue' ]='\033[0;104m'	
 	[ 'Light magenta' ]='\033[0;105m'	
 	[ 'Light cyan' ]='\033[0;106m'	
 	[ 'White' ]='\033[0;107m'	
)
echo "FOREGROUND COLORS:"	
for color in "${!FOREGROUND_COLORS[@]}"; do
    echo -e "${FOREGROUND_COLORS[$color]}${color}${NC}";
done

echo "BACKGROUND COLORS:"	
for color in "${!BACKGROUND_COLORS[@]}"; do
    echo -e "${BACKGROUND_COLORS[$color]}${color}${NC}";
done
