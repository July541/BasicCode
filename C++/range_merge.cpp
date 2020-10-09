#include <cstdio>
#include <vector>
#include <algorithm>

using namespace std;

struct node {
    int l, r;
    node(int l, int r) : l(l), r(r) {}
};

bool cmp(node& p1, node& p2) {
    if (p1.l == p2.l)
        return p1.r < p2.r;
    return p1.l < p2.l;
}

int main() {
    int n;
    scanf("%d", &n);
    vector<node> vec;
    for (int i = 0; i < n; ++i) {
        int a, b;
        scanf("%d%d", &a, &b);
        vec.push_back(node(a, b));
    }
    sort(vec.begin(), vec.end(), cmp);
    int l = vec[0].l;
    int r = vec[0].r;
    for (int i = 1; i < n; ++i) {
        if (vec[i].l > r) {
            printf("no");
            return 0;
        }
        if (vec[i].r > r)
            r = vec[i].r;
    }
    printf("%d %d", l, r);
    return 0;
}
