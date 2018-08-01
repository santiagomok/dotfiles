# ------------------------------------------------------------------------------ 
# File: function.sh
# ------------------------------------------------------------------------------ 

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
