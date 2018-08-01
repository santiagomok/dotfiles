#!/usr/bin/env python3
"""
VIM management script 
"""
__author__ = 'Santiago Mok (santiago.mok@gmail.com)'

__module__ = 'VIM'

import argparse
import datetime
import os
import sys
import subprocess

HOME = os.getenv('HOME') 
MODULE_PATH = os.path.abspath(os.path.dirname(__file__))

class VIM:
    def __init__(self):
        pass

    def install(self):
        print("INSTALL: {} CONFIGURATION".format(__module__))

        self.clean()

        # Create symlink
        vim_path = os.path.join(HOME, '.vim')
        os.mkdir( vim_path )
        os.symlink( os.path.join(MODULE_PATH, "plugin"), os.path.join(HOME,".vim","plugin") )
        os.symlink( os.path.join(MODULE_PATH, "ftplugin"), os.path.join(HOME,".vim","ftplugin") )
        os.symlink( os.path.join(MODULE_PATH, "vimrc"), os.path.join(HOME,".vimrc") )

        print(" Install Vundle...")
        vim_bundle_path = os.path.join(HOME, '.vim', 'bundle') 
        os.mkdir( vim_bundle_path )
        subprocess.run(['git', 'clone', 'https://github.com/VundleVim/Vundle.vim.git', os.path.join(vim_bundle_path,'Vundle.vim')])

        print(" Install Plugin...")
        subprocess.run(['vim', '+PluginInstall', '+qall'])

    def clean(self):
        print("CLEAN: {} CONFIGURATION".format(__module__))
        now = datetime.datetime.now()
        self.rename( os.path.join(HOME, '.vim'), os.path.join(HOME, '.vim.{}-{}-{}'.format(now.year, now.month, now.day)) )
        self.rename( os.path.join(HOME, '.vimrc'), os.path.join(HOME, '.vimrc.{}-{}-{}'.format(now.year, now.month, now.day)) )

    def update(self):
        print("TODO: Update")
        pass

    def rename(self, source, target):
        if os.path.exists(source):
            print(" Rename {} -> {}".format(source, target))
            os.rename(source, target)

def cmdline_args():
    """
    Command line argument parser and declaration
    """
    parser = argparse.ArgumentParser(description="Dotfiles management")

    actions = ['install', 'update', 'clean']
    parser.add_argument( 'action'
                        ,choices=actions
                        ,help="{} configuration (.vimrc, plugins, ...)".format(__module__))

    args = parser.parse_args()

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


