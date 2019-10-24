COMPILER_CPP=g++.exe
CPP_STD=-std=c++17 -D_GLIBCXX_FILESYSTEM_IS_WINDOWS
INCLUDE_DIRS=-I. -I./lib/win/mingw-std-threads-master -I./lib/win/filesystem-master/include/ghc
WARNING_FLAGS=-Wall -Wextra -fconcepts  -pthread  
#-Werror

all: build run run_tests

build:
	/bin/bash -c "time $(COMPILER_CPP) $(CPP_STD) -g -o main main.cpp $(INCLUDE_DIRS) $(WARNING_FLAGS)"
build_test:
	/bin/bash -c "time $(COMPILER_CPP) $(CPP_STD) -g -o tests/main tests/main.cpp $(INCLUDE_DIRS) $(WARNING_FLAGS)"

run: main
	/bin/bash -c "time ./$^"

run_tests: tests/main
	/bin/bash -c "time ./$^"

server: server.c
	/bin/bash -c "time $(COMPILER_CPP) -g -o $@ $^ $(WARNING_FLAGS)"

run_pseudo_server: server
	./$^

pseudo_server: server run_pseudo_server
