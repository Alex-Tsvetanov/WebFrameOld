[![Build Status](https://travis-ci.org/xavierholt/moka.svg)](https://travis-ci.org/xavierholt/moka)

# Moka
A simple C++ test framework  inspired by [Mocha](https://mochajs.org/) and named
after [my coffee maker](https://en.wikipedia.org/wiki/Moka_pot).


## Example

This is a simple  example that shows off all  the main features of Moka.  It has
tests organized into contexts like in Mocha.js, and uses macro assertions inside
them to check whatever conditions you want. A more complete example can be found
in `test/meta.cpp`.

```C++
#include "../moka.h"

Moka::Context test("Moka Demo!", [](Moka::Context& it) {
  it.should("test for equality", []() {
    must_equal(2 + 2, 4);
  });

  it.should("test for inequality", []() {
    must_not_equal("war",       "peace");
    must_not_equal("freedom",   "slavery");
    must_not_equal("ignorance", "strength");
  });

  it.should("test for exceptions", []() {
    must_throw(std::logic_error, []() {
      throw std::logic_error("doublethink");
    });
  });
});

int main() {
  return test.run();
}
```

Compiling the  above program  (you'll need C++ 11)  will result in an executable
with three tests.  When you run it, you should see them all pass.

```
[21:16:14 holt@Minerva moka]$ clang++ -std=c++11 test/demo.cpp
[21:16:33 holt@Minerva moka]$ ./a.out
Moka Demo!
  ✔ should test for equality
  ✔ should test for inequality
  ✔ should test for exceptions
```
