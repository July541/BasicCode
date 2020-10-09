#include <bits/stdc++.h>

using namespace std;

typedef long long ll;

ll tree[100005 << 2][2];
int N, Q;

void push_up(int p) {
    tree[p][0] = tree[p << 1][0] + tree[p << 1 | 1][0];
}

void push_down(int p, int t) {
    if (tree[p][1]) {
        tree[p << 1][1] += tree[p][1];
        tree[p << 1 | 1][1] += tree[p][1];
        tree[p << 1][0] += tree[p][1] * (t - (t >> 1));
        tree[p << 1 | 1][0] += tree[p][1] * (t >> 1);
        tree[p][1] = 0;
    }
}

void build(int p, int l, int r) {
    tree[p][1] = 0;
    if (l == r) {
        scanf("%lld", &tree[p][0]);
        return;
    }

    int m = (l + r) >> 1;
    build(p << 1, l, m);
    build(p << 1 | 1, m + 1, r);
    push_up(p);
}

void update(int p, int l, int r, int x, int y, int num) {
    if (x <= l && r <= y) {
        tree[p][0] += num * (r - l + 1);
        tree[p][1] += num;
        return;
    }
    push_down(p, r - l + 1);
    int m = (l + r) >> 1;
    if (x <= m)
        update(p << 1, l, m, x, y, num);
    if (y > m)
        update(p << 1 | 1, m + 1, r, x, y, num);
    push_up(p);
}

ll query(int p, int l, int r, int x, int y) {
    if (x <= l && r <= y) {
        return tree[p][0];
    }

    int m = (l + r) >> 1;
    push_down(p, r - l + 1);
    ll ret = 0;
    if (x <= m)
        ret += query(p << 1, l, m, x, y);
    if (y > m)
        ret += query(p << 1 | 1, m + 1, r, x, y);
    return ret;
}

int main() {
    memset(tree, 0, sizeof(tree));
    scanf("%d%d", &N, &Q);
    build(1, 1, N);
    while (Q--) {
        char ch[20];
        int a, b, c;
        scanf(" %s", ch);
        if (ch[0] == 'Q') {
            scanf("%d%d", &a, &b);
            printf("%lld\n", query(1, 1, N, a, b));
        }
        else {
            scanf("%d%d%d", &a, &b, &c);
            update(1, 1, N, a, b, c);
        }
    }
    return 0;
}
