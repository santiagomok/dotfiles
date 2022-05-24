#!/usr/bin/env bash
# vim: ft=bash
NVIM_SRC=<install_path_to_source>/neovim-0.5.0/
VIMRUNTIME=${NVIM_SRC}/runtime ${NVIM_SRC}/build/bin/nvim $@
