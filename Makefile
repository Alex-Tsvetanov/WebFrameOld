COMPILER_CPP=g++.exe
CPP_STD=--std=c++17 -O3 -Ofast
INCLUDE_DIRS=-I./tests -I./src -I./lib/win/mingw-std-threads-master -I./lib/win/filesystem-master/include/ -I./lib/win/stopwatch/ 
JINJA2CPP=-I./lib/Jinja2Cpp/.jinja2cpp-install/include -L./lib/Jinja2Cpp/.jinja2cpp-install/lib/static -ljinja2cpp
JINJA2CPP_DEFINES=-Dvariant_CONFIG_SELECT_VARIANT=variant_VARIANT_NONSTD -Dnssv_CONFIG_SELECT_STRING_VIEW=nssv_STRING_VIEW_NONSTD -Doptional_CONFIG_SELECT_OPTIONAL=optional_OPTIONAL_NONSTD -DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_ERROR_CODE_HEADER_ONLY
LIB_FLAGS=-lwsock32 -lws2_32 -static
WARNING_FLAGS=-Wall -Wno-long-long -pedantic -fconcepts

all: build build_test run_tests clean

build:
	$(COMPILER_CPP) $(CPP_STD) ./src/main.cpp -o ./bin/main.exe $(INCLUDE_DIRS) $(WARNING_FLAGS) $(LIB_FLAGS) $(JINJA2CPP) $(JINJA2CPP_DEFINES)

build_test:
	$(COMPILER_CPP) $(CPP_STD) ./tests/main.cpp -o ./bin/test.exe $(INCLUDE_DIRS) $(WARNING_FLAGS) $(LIB_FLAGS) $(JINJA2CPP) $(JINJA2CPP_DEFINES)

run: bin/main.exe
	./$^

run_tests: bin/test.exe
	./$^

clean:
	cat ./bin/log/performance.txt
	rm -rf ./bin/log/*
