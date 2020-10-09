#include <cstdio>
#include <map>

using namespace std;

int main() {
    int n, x;
    map<int, int> mp;
    scanf("%d", &n);
    for (int i = 0; i < n; ++i) {
        scanf("%d", &x);
        mp[x]++;
        }
        for (map<int, int>::iterator it = mp.begin(); it != mp.end(); ++it) {
            printf("%d %d\n", it->first, it->second);
    }
    return 0;
}
