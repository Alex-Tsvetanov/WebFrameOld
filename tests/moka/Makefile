all: demo.out meta.out
%.out: test/%.cpp
	${CXX} -std=c++11 -Wall -Wextra -Werror -o "$@" "$<"

test: all
	./demo.out
	./meta.out

clean:
	rm -f demo.out meta.out
