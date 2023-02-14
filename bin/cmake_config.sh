#!/usr/bin/env bash

# reference: https://stackoverflow.com/questions/56230175/how-to-find-compiler-path-automatically-in-cmake
export CC=`which gcc`
export CXX=`which g++`
export MAKE=`which gmake`

# gmake CMAKE_BUILD_TYPE=Release 
# or 
# gmake \
    # CMAKE_BUILD_TYPE=Release \
    # -DCMAKE_C_COMPILER:FILEPATH=`which gcc` \
    # -DCMAKE_CXX_COMPILER:FILEPATH=`which g++`

# install
# gmake CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=<some path> install

