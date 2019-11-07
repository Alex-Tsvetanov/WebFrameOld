COMPILER_CPP=g++.exe
CPP_STD=--std=c++17 -O3 -Ofast
INCLUDE_DIRS=-I./tests -I./src -I./lib/win/mingw-std-threads-master -I./lib/win/filesystem-master/include/ -I./lib/win/stopwatch/
LIB_FLAGS=-lwsock32 -lws2_32 -lws2_32
WARNING_FLAGS=-Wall -Wno-long-long -pedantic -fconcepts

all: build build_test run_tests clean

build:
	$(COMPILER_CPP) $(CPP_STD) ./src/main.cpp -o ./bin/main.exe $(INCLUDE_DIRS) $(WARNING_FLAGS) $(LIB_FLAGS)

build_test:
	$(COMPILER_CPP) $(CPP_STD) ./tests/main.cpp -o ./bin/test.exe $(INCLUDE_DIRS) $(WARNING_FLAGS) $(LIB_FLAGS)

run: bin/main.exe
	./$^

run_tests: bin/test.exe
	./$^

clean:
	cat ./bin/log/performance.txt
	rm -rf ./bin/log/*
