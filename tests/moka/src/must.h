#ifndef MOKA_MUST_H
#define MOKA_MUST_H

#include "util.h"

#include <cstring>
#include <exception>
#include <functional>
#include <sstream>
#include <string>

#define must_equal(a, b)     Moka::must::equal(__FILE__, __LINE__, a, b)
#define must_not_equal(a, b) Moka::must::not_equal(__FILE__, __LINE__, a, b)
#define must_throw(T, f)     Moka::must::throoow<T>(__FILE__, __LINE__, #T, f)
#define must_fail(m)         Moka::must::fail(__FILE__, __LINE__, m)

namespace Moka
{
  class Failure: public std::exception {
    const char* mFile;
    const int   mLine;
    std::string mWhat;
  public:
    Failure(const std::string& m): mFile(nullptr), mLine(0), mWhat(m) {}
    Failure(const char* f, int l, const std::string& m): mFile(f), mLine(l), mWhat(m) {}
    ~Failure() throw() {}

    const char* file() const {
      return mFile;
    }

    int line() const {
      return mLine;
    }

    const char* what() const throw() {
      return mWhat.c_str();
    }
  };

  namespace must {
    template <class A, class B>
    void equal(const char* f, int l, const A& a, const B& b) {
      if(a != b) {
        std::stringstream message;
        message << "Expected " << cli::g(b) << " but got " << cli::r(a);
        throw new Failure(f, l, message.str());
      }
    }

    void equal(const char* f, int l, const char* a, const char* b) {
      if(strcmp(a, b) != 0) {
        std::stringstream message;
        message << "Expected " << cli::g(b) << " but got " << cli::r(a);
        throw new Failure(f, l, message.str());
      }
    }

    void fail(const char* f, int l,  const char* m) {
      std::stringstream message;
      message << cli::r(m);
      throw new Failure(f, l, message.str());
    }

    template <class A, class B>
    void not_equal(const char* f, int l, const A& a, const B& b) {
      if(a == b) {
        std::stringstream message;
        message << "Expected anything but " << cli::r(b) << " but got " << cli::r(a);
        throw new Failure(f, l, message.str());
      }
    }

    template <class E>
    void throoow(const char* f, int l, const char* type, std::function<void()> fn) {
      try {
        fn();
      }
      catch(E& e) {
        // Good catch!
        return;
      }
      catch(std::exception& e) {
        std::stringstream message;
        message << "Expected to catch a " << cli::g(type) << " but got " << cli::r(e.what());
        throw new Failure(f, l, message.str());
      }

      std::stringstream message;
      message << "Expected to catch a " << cli::g(type) << " but nothing was thrown!";
      throw new Failure(f, l, message.str());
    }
  }
}

#endif
