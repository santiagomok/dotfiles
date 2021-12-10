import os
import sys 

if 'GCC_ROOTDIR' in os.environ and 'GCC_VER' in os.environ:
   gcc_path = os.getenv('GCC_ROOTDIR') + '/share/gcc-' + os.getenv('GCC_VER') + '/python'
else:
   gcc_path = '/p/psg/ctools/gcc/9.3.0/2/linux64/suse12/share/gcc-9.3.0/python'

sys.path.insert(0, '/p/psg/flows/sw/gdb_pretty_printers/python')
sys.path.insert(0, gcc_path)

def load_quartus_gdb_fast():
    ACDS_SRC_ROOT = "ACDS_SRC_ROOT"
    if ACDS_SRC_ROOT in os.environ: 
        quartus_gdb_fast_load_file = os.path.join(os.environ[ACDS_SRC_ROOT],"bcommon", "quartus", "gdb_fast_load.py")
        print("load " + quartus_gdb_fast_load_file)
        gdb.execute("source " + quartus_gdb_fast_load_file)

def load_quartus_pretty_printer():
    src_root=os.getenv("ACDS_SRC_ROOT")
    if not src_root:
        return

    try:
        from quartus.v1.printers import register_quartus_printers
        register_quartus_printers(None)
        print("Loaded Quartus pretty printer python modules.")
    except ImportError:
        print("Unable to load Quartus pretty printer python modules.")

    #  dst_root=os.getenv("ACDS_DEST_ROOT")
    #  # Source a build specific gdbinit
    #  if dst_root:
        #  build_specific_gdbinit = dst_root + "/quartus/common/not_shipped/scripts/gdbinit"
        #  print("Preparing to include GDB configuration " + build_specific_gdbinit)
        #  gdb.execute("source %s"%(build_specific_gdbinit))

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

def load_libstdcpp(): 
    try:
        from libstdcxx.v6.printers import register_libstdcxx_printers
        register_libstdcxx_printers (None)
        print("Loaded GNU libstdc++ pretty printer python modules.")
    except ImportError:
        print("Unable to load GNU libstdc++ pretty printer python modules!")

if __name__ == "__main__":
    #load_quartus_gdb_fast()
    load_libstdcpp()
    # load_boost_pretty_printer()
    load_quartus_pretty_printer()
