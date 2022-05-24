import os
import sys 

if 'GCC_ROOTDIR' in os.environ and 'GCC_VER' in os.environ:
    gcc_path = os.getenv('GCC_ROOTDIR') + '/share/gcc-' + os.getenv('GCC_VER') + '/python'
    sys.path.insert(0, gcc_path)

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
    # load_libstdcpp()
    # load_boost_pretty_printer()
