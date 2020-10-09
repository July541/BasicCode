#include <cstdio>
#include <vector>
#include <algorithm>
#include <functional>

using namespace std;

int main() {
    int n, k;
    scanf("%d", &n);
    vector<int> v(n);
    for (int i = 0; i < n; ++i) {
        scanf("%d", &v[i]);
    }
    scanf("%d", &k);
    sort(v.begin(), v.end(), std::greater<int>());
    for (int i = 0; i < k; ++i) {
        printf("%d\n", v[i]);
    }
    return 0;
}
