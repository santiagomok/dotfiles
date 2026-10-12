#!/usr/bin/env bash
# vim: ft=bash

# Current stable: nvim-0.12.6
# see :h $NVIM_APPNAME -- plugin migration#
APPNAME=nvim
VIMRUNTIME=$XDG_DATA_HOME/${APPNAME}/runtime NVIM_APPNAME=${APPNAME} nvim-0.12.6 $@
