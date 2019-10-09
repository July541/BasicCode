#include <iostream>

template <typename T>
struct RemoveReferenceConst_ {
private:
    using inter_type = typename std::remove_reference<T>::type;
public:
    using type = typename std::remove_const<inter_type>::type;
};

template <typename T>
using RemoveReferenceConst = typename RemoveReferenceConst_<T>::type;

int main() {
    RemoveReferenceConst<const int&> t = 3;
    std::cout << t << std::endl;
    return 0;
}