#!/bin/sh

prefix="$HOME/.local/llvm15"

# LLVM
cd llvm
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${prefix} -DCMAKE_PREFIX_PATH=${prefix} -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_LIBXML2=OFF -G Ninja -DLLVM_PARALLEL_LINK_JOBS=1
ninja -j 12 install
cd ../..

# LLD
cd lld
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${prefix} -DCMAKE_PREFIX_PATH=${prefix} -DCMAKE_BUILD_TYPE=Release  -G Ninja -DLLVM_PARALLEL_LINK_JOBS=1
ninja -j 12 install
cd ../..

# Clang
cd clang
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${prefix} -DCMAKE_PREFIX_PATH=${prefix} -DCMAKE_BUILD_TYPE=Release  -G Ninja -DLLVM_PARALLEL_LINK_JOBS=1
ninja -j 12 install
cd ../..
