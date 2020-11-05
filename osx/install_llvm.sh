#!/bin/bash

# Get prereqs
pip install cmake ninja

# Test that pip install modules are in $PATH
cmake --version
ninja --version

# Get sources
git clone https://github.com/llvm/llvm-project.git

# Build LLVM and Clang
cd llvm-project
mkdir build && cd build
cmake -G Ninja ../llvm -DCMAKE_INSTALL_PREFIX=$(pwd)/darwin_build -DCMAKE_BUILD_TYPE=Release
ninja
ninja install
