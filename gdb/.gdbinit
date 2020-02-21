set breakpoint pending on
set print elements 0
set auto-load safe-path /

source $PSG_SWIP/udm/gdbinit

source $HOME/.local/dotfiles/gdb/gdb-dashboard/.gdbinit

# Alias ------------------------------------------------------------------------

define dashboard_conf
    dashboard -layout source stack
    dashboard source -style context 15
    dashboard stack -style limit 5
    #dashboard stack -style locals True
end

