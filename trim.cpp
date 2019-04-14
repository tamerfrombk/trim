#include <iostream>
#include <string>
#include <algorithm>
#include <cctype>
#include <type_traits>

static std::string trim(const std::string& s)
{
    static_assert(std::is_convertible<std::string::value_type, unsigned char>::value, "string value_type must be convertible to unsigned char");

    auto pred = [](unsigned char c) { return std::isspace(c); };
    auto start = std::find_if_not(s.cbegin(), s.cend(), pred);
    auto end = std::find_if_not(s.crbegin(), s.crend(), pred).base();
    return (start > end) ? std::string() : std::string(start, end);
}

int main()
{
    std::string line;
    while (std::getline(std::cin, line)) {
        std::cout << trim(line) << '\n';
    }
}
