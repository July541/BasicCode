#include <cstdio>
#include <iostream>
#include <vector>

using namespace std;

long long res = 0;
vector<int> v(100005);
vector<int> t(100005);

void merge(int l, int r) {
    int m = (l + r) / 2;
    int a = l;
    int b = m + 1;
    int i = 0;
    while (a <= m && b <= r) {
        if (v[a] < v[b])
            t[i++] = v[b++];
        else {
            t[i++] = v[a++];
            res += r - b + 1;
        }
    }
    while (a <= m)
        t[i++] = v[a++];
    while (b <= r)
        t[i++] = v[b++];
    for (int j = l; j <= r; ++j) {
        v[j] = t[j - l];
    }
}

void sort(int l, int r) {
    if (l < r) {
        int m = (l + r) / 2;
        sort(l, m);
        sort(m + 1, r);
        merge(l, r);	
    }
}

int main() {
    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; ++i) {
        scanf("%d", &v[i]);
    }
    sort(0, n - 1);
    cout << res;
    return 0;
}
