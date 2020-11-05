#!/bin/bash

# Get prereqs
python3 -m pip install --user cmake ninja

# Get sources
git clone https://github.com/llvm/llvm-project.git

# Build LLVM and Clang
cd llvm-project
mkdir build && cd build
cmake -G Ninja ../llvm -DCMAKE_INSTALL_PREFIX=$(pwd)/darwin_build -DCMAKE_BUILD_TYPE=Release
ninja install
