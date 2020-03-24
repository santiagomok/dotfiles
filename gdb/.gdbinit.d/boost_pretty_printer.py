# Boost-Pretty-Printer
import sys 
sys.path.insert(1, '/p/psg/swip/w/moksanti/local/share/gdb/Boost-Pretty-Printer') 
import boost 
boost.register_printers(boost_version=(1,70,0)) 
