#!/bin/bash
cd examples
make
echo "Created"
export LD_LIBRARY_PATH=${PWD}/../build
./test