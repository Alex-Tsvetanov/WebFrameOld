#include "../moka.h"

Moka::Context test("Moka", [](Moka::Context& it) {
  it.has("test blocks", [](Moka::Context& it) {
    it.should("succeed if nothing unusual happens", []() {
      // Everything. Is. Fine.
    });

    it.should("fail if an exception is thrown", []() {
      throw std::bad_exception();
    });
  });

  it.has("#must_equal()", [](Moka::Context& it) {
    it.should("succeed if its arguments are equal", []() {
      must_equal(2 + 2, 4);
    });

    it.should("fail if its arguments are not equal", []() {
      must_equal(2 + 2, 5);
    });
  });

  it.has("#must_not_equal()", [](Moka::Context& it) {
    it.should("succeed if its arguments are not equal", []() {
      must_not_equal(2 + 2, 22);
    });

    it.should("fail if its arguments are equal", []() {
      must_not_equal(2 + 2, 4);
    });
  });

  it.has("#must_throw()", [](Moka::Context& it) {
    it.should("succeed if the expected exception is thrown", []() {
      must_throw(std::logic_error, []() {
        throw std::logic_error("Oh dear. I hadn't thought of that.");
      });
    });

    it.should("fail if the wrong exception is thrown", []() {
      must_throw(std::logic_error, []() {
        throw std::bad_exception();
      });
    });

    it.should("fail if nothing is thrown", []() {
      must_throw(std::logic_error, []() {
        // Nothing to see here. Move along.
      });
    });
  });
});

int main() {
  std::cout << "===  These Are The Tests To Be Tested  ===============================\n\n";
  Moka::Report report;
  test.test(report);
  report.print();

  Moka::Context meta("Meta", [&](Moka::Context& it) {
    it.has("test blocks", [&](Moka::Context& it) {
      it.should("succeed if nothing unusual happens", [&]() {
        must_equal(report.items()[0].id, 1);
        must_equal(report.items()[0].name, "Moka test blocks should succeed if nothing unusual happens");
        must_equal(report.items()[0].error, nullptr);
      });

      it.should("fail if an exception is thrown", [&]() {
        must_equal(report.item(1).id, 2);
        must_equal(report.item(1).name, "Moka test blocks should fail if an exception is thrown");
        must_not_equal(report.item(1).error, nullptr);
        must_equal(report.item(1).error->what(), "Unexpected exception: " + Moka::cli::y("std::bad_exception"));
        must_equal(report.item(1).error->file(), nullptr);
      });
    });

    it.has("#must_equal()", [&](Moka::Context& it) {
      it.should("succeed if its arguments are equal", [&]() {
        must_equal(report.item(2).id, 3);
        must_equal(report.item(2).name, "Moka #must_equal() should succeed if its arguments are equal");
        must_equal(report.item(2).error, nullptr);
      });

      it.should("fail if its arguments are not equal", [&]() {
        must_equal(report.item(3).id, 4);
        must_equal(report.item(3).name, "Moka #must_equal() should fail if its arguments are not equal");
        must_not_equal(report.item(3).error, nullptr);
        must_equal(report.item(3).error->what(), "Expected " + Moka::cli::g(5) + " but got " + Moka::cli::r(4));
        must_equal(report.item(3).error->file(), "test/meta.cpp");
        must_equal(report.item(3).error->line(), 20);
      });
    });

    it.has("#must_not_equal()", [&](Moka::Context& it) {
      it.should("succeed if its arguments are not equal", [&]() {
        must_equal(report.item(4).id, 5);
        must_equal(report.item(4).name, "Moka #must_not_equal() should succeed if its arguments are not equal");
        must_equal(report.item(4).error, nullptr);
      });

      it.should("fail if its arguments are equal", [&]() {
        must_equal(report.item(5).id, 6);
        must_equal(report.item(5).name, "Moka #must_not_equal() should fail if its arguments are equal");
        must_not_equal(report.item(5).error, nullptr);
        must_equal(report.item(5).error->what(), "Expected anything but " + Moka::cli::r(4) + " but got " + Moka::cli::r(4));
        must_equal(report.item(5).error->file(), "test/meta.cpp");
        must_equal(report.item(5).error->line(), 30);
      });
    });

    it.has("#must_throw()", [&](Moka::Context& it) {
      it.should("succeed if the expected exception is thrown", [&]() {
        must_equal(report.item(6).id, 7);
        must_equal(report.item(6).name, "Moka #must_throw() should succeed if the expected exception is thrown");
        must_equal(report.item(6).error, nullptr);
      });

      it.should("fail if the wrong exception is thrown", [&]() {
        must_equal(report.item(7).id, 8);
        must_equal(report.item(7).name, "Moka #must_throw() should fail if the wrong exception is thrown");
        must_not_equal(report.item(7).error, nullptr);
        must_equal(report.item(7).error->what(), "Expected to catch a " + Moka::cli::g("std::logic_error") + " but got " + Moka::cli::r("std::bad_exception"));
        must_equal(report.item(7).error->file(), "test/meta.cpp");
        must_equal(report.item(7).error->line(), 44);
      });

      it.should("fail if nothing is thrown", [&]() {
        must_equal(report.item(8).id, 9);
        must_equal(report.item(8).name, "Moka #must_throw() should fail if nothing is thrown");
        must_not_equal(report.item(8).error, nullptr);
        must_equal(report.item(8).error->what(), "Expected to catch a " + Moka::cli::g("std::logic_error") + " but nothing was thrown!");
        must_equal(report.item(8).error->file(), "test/meta.cpp");
        must_equal(report.item(8).error->line(), 50);
      });
    });
  });

  std::cout << "===  These Are The Tests Testing The Tests To Be Tested  =============\n\n";
  return meta.run();
}
