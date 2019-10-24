#ifndef MOKA_TEST_H
#define MOKA_TEST_H

#include "must.h"
#include "util.h"

#include <exception>
#include <functional>
#include <iostream>
#include <string>
#include <vector>

namespace Moka
{
  class Report {
    struct Item {
      int         id;
      std::string name;
      Failure*    error;
    public:
      Item(int i, std::string s, Failure* f): id(i), name(s), error(f) {}
    };
  protected:
    std::vector<Item> mItems;
    std::vector<std::string> mNames;
  protected:
    std::string prefix(const Item& i) const {
      if(i.error == nullptr) {
        return cli::g("✔ ", true);
      }
      else if(i.error->file() == nullptr) {
        return cli::y("▲ ", true);
      }
      else {
        return cli::r("✘ ", true);
      }
    }
  public:
    void enter(std::string name) {
      indent();
      std::cout << cli::bold(name) << "\n";
      mNames.push_back(name);
    }

    int id() const {
      return mItems.size() + 1;
    }

    void indent() const {
      for(int i = mNames.size(); i > 0; --i) {
        std::cout << "  ";
      }
    }

    const Item& item(int index) const {
      return mItems[index];
    }

    const std::vector<Item>& items() const {
      return mItems;
    }

    void leave() {
      mNames.pop_back();
    }

    int level() const {
      return mNames.size();
    }

    void print() const {
      std::cout << "\n";
      for(const Item& i: mItems) {
        if(i.error == nullptr) continue;
        std::cout << prefix(i) << i.id << ") " << i.name << ":\n";
        std::cout << "  " << i.error->what() << "\n";

        if(i.error->file()) {
          std::cout << "  in " << cli::bold(i.error->file());
          std::cout << ':' << i.error->line() << "\n";
        }

        std::cout << "\n";
      }
    }

    void push(std::string testname, Failure* f = nullptr) {
      std::stringstream stream;
      for(auto& name: mNames) stream << name << " ";
      stream << testname;

      mItems.push_back(Item(id(), stream.str(), f));
      summarize(mItems.back(), testname);
    }

    void summarize(const Item& i, const std::string& name) const {
      indent();
      std::cout << prefix(i) << i.id;
      std::cout << ") " << name << "\n";
    }
  };

  class Base {
  public:
    virtual void test(Report& report) = 0;

    void indent(int level) {
      while(level --> 0) std::cout << "  ";
    }

    bool run() {
      Report report;
      this->test(report);
      report.print();

      return report.items().empty();
    }

    Report test() {
      Report report;
      this->test(report);
      return report;
    }
  };

  class Test: public Base {
  protected:
    std::string           mName;
    std::function<void()> mFunction;
  public:
    Test(std::string name, std::function<void()> fn): mName(name), mFunction(fn) {
      // All done.
    }

    void test(Report& report) {
      try {
        mFunction();
        report.push(mName);
      }
      catch(Failure* error) {
        report.push(mName, error);
      }
      catch(std::exception& error) {
        std::string prefix("Unexpected exception: ");
        Failure* e = new Failure(prefix + cli::y(error.what()));
        report.push(mName, e);
      }
    }
  };

  class Context: public Base {
  protected:
    std::string           mName;
    std::vector<Base*>    mMembers;
    std::function<void()> mSetup;
    std::function<void()> mTeardown;
    bool                  mHasSetup;
    bool                  mHasTeardown;
  public:
    Context(std::string name): mName(name), mMembers() {
      mHasTeardown = false;
      mHasSetup = false;
    }

    Context(std::string name, std::function<void(Context&)> fn): mName(name), mMembers() {
      mHasTeardown = false;
      mHasSetup = false;
      fn(*this);
    }

    void has(std::string name, std::function<void(Context&)> fn) {
      Context* child = new Context(name, fn);
      mMembers.push_back(child);
    }

    void setup(std::function<void()> fn) {
      mHasSetup = true;
      mSetup = fn;
    }

    void should(std::string name, std::function<void()> fn) {
      Test* test = new Test("should " + name, fn);
      mMembers.push_back(test);
    }

    void teardown(std::function<void()> fn) {
      mHasTeardown = true;
      mTeardown = fn;
    }

    void test(Report& report) {
      report.enter(mName);
      if(mHasSetup) mSetup();
      for(auto m: mMembers) m->test(report);
      if(mHasTeardown) mTeardown();
      report.leave();
    }
  };
}

#endif
