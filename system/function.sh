# ------------------------------------------------------------------------------ 
# File: function.sh
# ------------------------------------------------------------------------------ 

# ------------------------------------------------------------------------------ 
function mcd() {
        mkdir -p $*
        cd $*
}
export -f mcd

function add_to_path {
	if [ -z `echo $PATH |grep $1` ]; then
		export PATH=$2:${PATH}
	fi
}

function psgrep() {
    ps -ef | { 
        read -r;
        echo "$REPLY";
        grep --color=auto "$@"
    }
}

function du10() {
    # Show directory size sorted from largest
    # Usage: du10 dir/\* (asterisk need escape)
    du -shx $1 | sort -rh | head -10
}
