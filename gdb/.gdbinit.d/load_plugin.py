import os
import sys 

def load_quartus_pretty_printer():
    ACDS_SRC_ROOT = "ACDS_SRC_ROOT"
    if ACDS_SRC_ROOT in os.environ: 
        quartus_gdb_fast_load_file = os.path.join(os.environ[ACDS_SRC_ROOT],"bcommon", "quartus", "gdb_fast_load.py")
        print("load " + quartus_gdb_fast_load_file)
        gdb.execute("source " + quartus_gdb_fast_load_file)

def load_boost_pretty_printer():
    '''Boost-Pretty-Printer'''
    boost_pp_path = os.path.join(os.environ["HOME"],".local","share","gdb","Boost-Pretty-Printer")
    if not os.path.exists(boost_pp_path):
        return

    sys.path.insert(1, boost_pp_path)
    import boost 
    ver_major = 1
    ver_minor = 73
    print("load boost_pretty_printer -- boost version: {}.{}".format(ver_major,ver_minor))
    boost.register_printers(boost_version=(ver_major,ver_minor,0)) 

if __name__ == "__main__":
    load_quartus_pretty_printer()
    load_boost_pretty_printer()
