#!/bin/bash

# Get prereqs
python -m pip install cmake ninja

# Test that pip install modules are in $PATH
echo "Testing that pip installed the dependencies in the PATH"
cmake --version && which cmake
ninja --version && which ninja

# Get sources
git clone https://github.com/llvm/llvm-project.git

# Build LLVM and Clang
cd llvm-project
mkdir build && cd build
cmake -G Ninja ../llvm -DCMAKE_INSTALL_PREFIX=$(pwd)/darwin_build -DCMAKE_BUILD_TYPE=Release
ninja
ninja install
