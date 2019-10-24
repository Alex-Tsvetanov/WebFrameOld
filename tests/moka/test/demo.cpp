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
