#include <iostream>

template <bool AddOrRemoveRef> struct Fun_;

template <>
struct Fun_<true> {
    template <typename T>
    using type = std::add_lvalue_reference<T>;
};

template <>
struct Fun_<false> {
    template <typename T>
    using type = std::remove_reference<T>;
};

template <typename T>
template <bool AddOrRemove>
using Fun = typename Fun_<AddOrRemove>::template type<T>;

template <typename T>
using Res_ = Fun<false>;

int main() {
    Res_<int&>::type h = 3;
    std::cout << h << std::endl;
    return 0;
}