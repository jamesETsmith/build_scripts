#!/bin/bash

#
# Get prereqs
#

FILE=/etc/os-release
if test -f "$FILE"; then
    echo "$FILE exists. We're probably on a Linux system."
    sudo apt-get install -y cmake ninja
else 
    echo "$FILE does not exist. We're probably not on Linux."
    python -m pip install cmake ninja
    cmake --version && which cmake
    ninja --version && which ninja
fi

# Get sources
git clone https://github.com/llvm/llvm-project.git

# Build LLVM and Clang
cd llvm-project
mkdir build && cd build
cmake -G Ninja ../llvm -DCMAKE_INSTALL_PREFIX=$(pwd)/darwin_build -DCMAKE_BUILD_TYPE=Release
ninja
ninja install
