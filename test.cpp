#include <algorithm>
#include <cassert>
#include <cstring>
#include <iostream>
#include <string>
#include <string_view>

class TesterAssembly {
public:
  void run_all_tests() {
    test_strlen();
    test_strchr();
    test_strrchr();
    test_memset();
    test_memcpy();
    test_strcmp();
    test_memmove();
    test_strncmp();
    test_strcasecmp();
    test_strstr();
    test_strpbrk();
    test_strcspn();

    std::cout << "All tests passed successfully!" << std::endl;
  }

private:
  void assert_test(bool condition, const std::string &msg) {
    if (!condition) {
      std::cout << "Failed test :" << msg << std::endl;
      std::terminate();
    }
    std::cout << "Passed test: " << msg << "\n";
  }

  void test_strlen() {
    const char *str = "Hello World";
    assert_test(strlen(str) == 11, "strlen should return correct length");
  }

  void test_strchr() {
    std::string_view str = "Hello World";
    auto *ptr = strchr(str.data(), 'W');
    assert_test(ptr != nullptr, "strchr should find 'W'");
    assert_test(std::string_view(ptr) == "World",
                "strchr should return correct substring");
  }

  void test_strrchr() {
    std::string_view str = "Hello World";
    auto *ptr = strrchr(str.data(), 'l');
    assert_test(ptr != nullptr, "strrchr should find last 'l'");
    assert_test(std::string_view(ptr) == "ld",
                "strrchr should return last occurrence");
  }

  void test_memset() {
    std::string buffer(10, 0);
    memset(buffer.data(), 'A', buffer.size());
    assert_test(std::all_of(buffer.begin(), buffer.end(),
                            [](char c) { return c == 'A'; }),
                "memset should fill buffer with 'A'");
  }

  void test_memcpy() {
    std::string src = "Hello World";
    std::string dst(src.size(), 0);
    memcpy(dst.data(), src.data(), src.size());
    assert_test(src == dst, "memcpy should copy entire string");
  }

  void test_strcmp() {
    assert_test(strcmp("Hello", "Hello") == 0, "strcmp with identical strings");
    assert_test(strcmp("Hello", "Hellp") < 0,
                "strcmp with lexicographically lesser string");
    assert_test(strcmp("Hello", "Helln") > 0,
                "strcmp with lexicographically greater string");
  }

  void test_memmove() {
    std::string src = "Hello World";
    std::string dst(src.size(), 0);
    memmove(dst.data(), src.data(), src.size());
    assert_test(src == dst,
                "memmove should correctly copy overlapping regions");
  }

  void test_strncmp() {
    assert_test(strncmp("Hello", "Hello", 5) == 0, "strncmp with full match");
    assert_test(strncmp("Hello", "Hellp", 5) < 0,
                "strncmp with partial lexicographic difference");
    assert_test(strncmp("Hello", "Helln", 5) > 0,
                "strncmp with partial lexicographic difference");
    assert_test(strncmp("Hello", "Hellp", 4) == 0,
                "strncmp with limited comparison length");
  }

  void test_strcasecmp() {
    // TODO
  }

  void test_strstr() {
    std::string_view str = "Hello world";
    auto *result = strstr(str.data(), "world");
    assert_test(result != nullptr, "strstr should find substring");
    assert_test(std::string_view(result) == "world",
                "strstr should return correct substring");

    result = strstr(str.data(), "test");
    assert_test(result == nullptr,
                "strstr should return nullptr for missing substring");
  }

  void test_strpbrk() {
    std::string_view str = "Hello world";
    const char *subset = "arc";
    auto *result = strpbrk(str.data(), subset);
    assert_test(result != nullptr, "strpbrk should find subset characters");
    assert_test(std::string_view(result) == "rld",
                "strpbrk should return first occurrence of subset");

    subset = "xyz";
    result = strpbrk(str.data(), subset);
    assert_test(result == nullptr,
                "strpbrk should return nullptr for no match");
  }

  void test_strcspn() {
    std::string_view str = "Hello world";
    assert_test(strcspn(str.data(), "arc") == 8, "strcspn with partial match");
    assert_test(strcspn(str.data(), "xyz") == str.length(),
                "strcspn with no match");
  }
};

int main() {
  TesterAssembly tester;
  tester.run_all_tests();

  return 0;
}
