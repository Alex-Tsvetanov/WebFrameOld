#!/bin/bash

curr_dir=$PWD;
cd "/c/Program Files (x86)/CodeBlocks/mingw/bin";
echo "Compile:";
./g++.exe "$curr_dir/src/main.cpp" -o "$curr_dir/bin/main.exe" -I"$curr_dir/src" -I"$curr_dir/lib/win/mingw-std-threads-master" -I"$curr_dir/lib/win/filesystem-master/include/" -Wall -Wextra -lws2_32 -pthread -lwsock32 --std=c++17
cd "$curr_dir"
echo "Run:";
./bin/main.exe
