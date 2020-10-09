#include <bits/stdc++.h>

using namespace std;

int N, Q;
int h[50005];
int tree[4 * 50005][2];

void build(int p, int l, int r) {
    if (l == r) {
        tree[p][0] = h[l];
        tree[p][1] = h[l];
        return;
    }
    int m = (l + r) / 2;
    build(p * 2, l, m);
    build(p * 2 + 1, m + 1, r);
    tree[p][0] = max(tree[p * 2][0], tree[p * 2 + 1][0]);
    tree[p][1] = min(tree[p * 2][1], tree[p * 2 + 1][1]);
}

int* query(int p, int l, int r, int x, int y) {
    if (x <= l && r <= y) {
        return tree[p];
    }
    int m = (l + r) >> 1;
    if (y <= m)
        return query(p * 2, l, m, x, y);
    if (x > m)
        return query(p * 2 + 1, m + 1, r, x, y);
    int* r1 = query(p * 2, l, m, x, m);
    int* r2 = query(p * 2 + 1, m + 1, r, m + 1, y);
    int* res = new int[2];
    res[0] = max(r1[0], r2[0]);
    res[1] = min(r1[1], r2[1]);
    return res;
}

int main() {
    scanf("%d%d", &N, &Q);
    int a, b;
    for (int i = 1; i <= N; ++i) {
        scanf("%d", &h[i]);
    }
    build(1, 1, N);
    for (int i = 0; i < Q; ++i) {
        scanf("%d%d", &a, &b);
        int* res = query(1, 1, N, a, b);
        printf("%d\n", res[0] - res[1]);
    }
    return 0;
}
