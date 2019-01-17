#include <string>
#include <vector>
#include <map>
#include <cmath>
#include <algorithm>

class SumOfDivided
{
private:
    static std::map<int, long long> mp;
    
    static std::string mpToString() {
        std::string ret;
        for (const auto& o : mp) {
            ret += "(";
            ret += std::to_string(o.first);
            ret += " ";
            ret += std::to_string(o.second);
            ret += ")";
        }
        return ret;
    }

    static void setMap(int n) {
        int t = std::abs(n);
        for (int i = 2; i <= t; i++) {
            if (t % i == 0 && isPrime(i)) {
                mp[i] += n;
            }
        }
    }
    
    static bool isPrime(int n) {
        if (n == 2)
            return true;
        for (int i = 2; i <= (int)std::sqrt(n); i++) {
            if (n % i == 0)
                return false;
        }
        return true;
    }
public:
    static std::string sumOfDivided(std::vector<int> &lst) {
        mp.clear();
        std::for_each(lst.cbegin(), lst.cend(), [](int n) { setMap(n); });
        return mpToString();
    }
};

std::map<int, long long> SumOfDivided::mp = std::map<int, long long>();

#include <iostream>

int main() {
    std::vector<int> d1 = {15, 30, -45};
    // SumOfDivided.
    std::cout << SumOfDivided().sumOfDivided(d1) << std::endl;
    return 0;
}