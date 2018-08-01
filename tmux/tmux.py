#!/usr/bin/env python3
"""
TMUX management script 
"""
__author__ = 'Santiago Mok (santiago.mok@gmail.com)'

__module__ =  'TMUX'

import argparse
import datetime
import os
import sys
import subprocess

HOME = os.getenv('HOME') 
MODULE_PATH = os.path.abspath(os.path.dirname(__file__))

class TMUX:
    def __init__(self):
        pass

    def install(self):
        print("INSTALL: {} CONFIGURATION".format(__module__))

        self.clean()

        # Create symlink
        os.symlink( os.path.join(MODULE_PATH, "tmux.conf"), os.path.join(HOME,".tmux.conf") )

    def clean(self):
        print("CLEAN: {} CONFIGURATION".format(__module__))
        now = datetime.datetime.now()
        self.rename( os.path.join(HOME, '.tmux.conf'), os.path.join(HOME, '.tmux.conf.{}-{}-{}'.format(now.year, now.month, now.day)) )

    def update(self):
        print("TODO: Update")
        pass

    def rename(self, source, target):
        if os.path.exists(source):
            print(" Rename {0} -> {1}".format(source, target))
            os.rename(source, target)

def cmdline_args():
    """
    Command line argument parser and declaration
    """
    parser = argparse.ArgumentParser(description="Dotfiles management")

    actions = ['install', 'update', 'clean']
    parser.add_argument( 'action'
                        ,choices=actions
                        ,help="{} configuration".format(__module__))

    args = parser.parse_args()

    print(args)

    return args

if __name__ == '__main__':
    if sys.version_info < (3,0,0):
        sys.stderr.write("Python 3.0 or later required!\n")
        sys.exit(1)

    try:
        args = cmdline_args()
        getattr(globals()[__module__](), args.action)()

    except OSError as err:
        print("OS Error: {0}".format(err))


