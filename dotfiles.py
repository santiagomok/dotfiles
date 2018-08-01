#!/usr/bin/env python3
"""
Dotfiles management script 
"""

import argparse
import os
import sys
import subprocess

USER_HOME = os.getenv('HOME') 
DOTFILE = os.path.abspath(os.path.dirname(__file__))

COMPONENTS = [
     "vim"
    ,"system"
]
SYMBOLIC_LINKS = {
    os.path.join(DOTFILE,"vim","plugin.symlink")            : os.path.join(USER_HOME,".vim","plugin"),
    os.path.join(DOTFILE,"vim","ftplugin.symlink")          : os.path.join(USER_HOME,".vim","ftplugin"),
    os.path.join(DOTFILE,"vim","vimrc.symlink")             : os.path.join(USER_HOME,".vimrc"),
    os.path.join(DOTFILE,"sh","bashrc.symlink")             : os.path.join(USER_HOME,".bashrc"),
    os.path.join(DOTFILE,"sh","bash_profile.symlink")       : os.path.join(USER_HOME,".bash_profile"),
    os.path.join(DOTFILE,"sh","zshrc.symlink")              : os.path.join(USER_HOME,".zshrc"),
    "~/Library/Mobile Documents/com~apple~CloudDocs/Code"   : "~/Code"
}

def create_symlink():

    for src,link_name in SYMBOLIC_LINKS.items():
        print("Linking... " + link_name + " -> " + src)
        
def run_components(args):
    for component in args.components:
        print("Run {} {}".format(component, args.action))
        script_name = component + ".py"
        script_cmd = os.path.join(DOTFILE, component, script_name)
        subprocess.run([script_cmd, args.action])

def cmdline_args():
    """
    Command line argument parser and declaration
    """
    parser = argparse.ArgumentParser(description="Dotfiles management")

    actions = ['install', 'update', 'clean']
    parser.add_argument( 'action'
                        ,choices=actions
                        ,help='Select action to apply to all or selected component(s)')

    parser.add_argument( '-c'
                        ,'--components'
                        ,choices=COMPONENTS
                        ,action='append'
                        ,help='List of component to apply selected action {install, update, clean}. Default: "all" components are selected if not specified.'
                        ,type=str 
                        ,required=False
                        ) 
    args = parser.parse_args()

    # Default to all COMPONENTS if option not specified
    if not args.components:
        args.components = COMPONENTS

    print(args)

    return args

if __name__ == '__main__':
    if sys.version_info < (3,0,0):
        sys.stderr.write("Python 3.0 or later required!\n")
        sys.exit(1)

    try:
        args = cmdline_args()
        run_components(args)
    except OSError as err:
        print("OS error: {0}".format(err))


