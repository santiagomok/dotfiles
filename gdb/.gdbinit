
# Better GDB defaults ----------------------------------------------------------

set history save
set verbose off
# set print array off
set print array-indexes on
set print elements 0
set print pretty on
# set python print-stack full
set breakpoint pending on
set auto-load safe-path /

python
import os
if os.path.exists('bp.txt'):
    gdb.execute('source bp.txt')

end
