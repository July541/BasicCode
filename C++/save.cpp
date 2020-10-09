/*
描述
公主被恶人抓走，被关押在牢房的某个地方。牢房用N*M (N, M <= 200)的矩阵来表示。矩阵中的每项可以代表道路（@）、墙壁（#）、和守卫（x）。
英勇的骑士（r）决定孤身一人去拯救公主（a）。我们假设拯救成功的表示是“骑士到达了公主所在的位置”。
由于在通往公主所在位置的道路中可能遇到守卫，骑士一旦遇到守卫，必须杀死守卫才能继续前进。
现假设骑士可以向上、下、左、右四个方向移动，每移动一个位置需要1个单位时间，杀死一个守卫需要花费额外的1个单位时间。
同时假设骑士足够强壮，有能力杀死所有的守卫。

给定牢房矩阵，公主、骑士和守卫在矩阵中的位置，请你计算拯救行动成功需要花费最短时间。

输入
第一行为一个整数S，表示输入的数据的组数（多组输入）
随后有S组数据，每组数据按如下格式输入
1、两个整数代表N和M, (N, M <= 200).
2、随后N行，每行有M个字符。"@"代表道路，"a"代表公主，"r"代表骑士，"x"代表守卫, "#"代表墙壁。
输出
如果拯救行动成功，输出一个整数，表示行动的最短时间。
如果不可能成功，输出"Impossible"
*/

#include <bits/stdc++.h>

using namespace std;

int mp[205][205];
int vis[205][205];
int n, m, sx, sy, tx, ty;
int dir[4][2] = { -1, 0, 0, -1, 0, 1, 1, 0 };
int res;

struct Node {
    int x, y, t;
    Node(int x, int y, int t) : x(x), y(y), t(t) {}
    friend bool operator<(Node n1, Node n2) {
        return n1.t > n2.t;
    }
};

void bfs() {
    priority_queue<Node> que;
    que.push(Node(sx, sy, 0));
    vis[sx][sy] = 1;
    while (!que.empty()) {
        Node node = que.top();
        que.pop();
        if (node.x == tx && node.y == ty) {
            res = min(res, node.t);
            continue;
        }
        for (int i = 0; i < 4; ++i) {
            int x = node.x + dir[i][0];
            int y = node.y + dir[i][1];
            if (x >= 0 && x < n && y >= 0 && y < m && !vis[x][y] && mp[x][y] != '#') {
                vis[x][y] = 1;
                if (mp[x][y] == 'x')
                    que.push(Node(x, y, node.t + 2));
                else
                    que.push(Node(x, y, node.t + 1));
            }
        }
    }
    if (res == INT_MAX)
        printf("Impossible\n");
    else
        printf("%d\n", res);
}

int main() {
    int T;
    scanf("%d", &T);
    while (T--) {
        memset(mp, 0, sizeof(mp));
        memset(vis, 0, sizeof(vis));
        res = INT_MAX;
        scanf("%d%d", &n, &m);
        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < m; ++j) {
                scanf(" %c", &mp[i][j]);
                if (mp[i][j] == 'r') {
                    sx = i;
                    sy = j;
                }
                if (mp[i][j] == 'a') {
                    tx = i;
                    ty = j;
                }
            }
        }
        bfs();
    }
    return 0;
}
