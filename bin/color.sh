#!/usr/bin/env bash
# ------------------------------------------------------------------------------ 
# File: color.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 
# Color Table
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

NC='\033[0m'
RED=${FOREGROUND_COLORS[RED]}
GREEN=${FOREGROUND_COLORS[GREEN]}
YELLOW=${FOREGROUND_COLORS[YELLOW]}

