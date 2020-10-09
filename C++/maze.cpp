/*
描述
当你站在一个迷宫里的时候，往往会被错综复杂的道路弄得失去方向感，如果你能得到迷宫地图，事情就会变得非常简单。
假设你已经得到了一个n*m的迷宫的图纸，请你找出从起点到出口的最短路。

输入
第一行是两个整数n和m(1<=n,m<=100)，表示迷宫的行数和列数。
接下来n行，每行一个长为m的字符串，表示整个迷宫的布局。字符'.'表示空地，'#'表示墙，'S'表示起点,'T'表示出口。
输出
输出从起点到出口最少需要走的步数。
*/

#include <cstdio>
#include <queue>
#include <map>
#include <memory.h>
#include <iostream>

using namespace std;

char mp[105][105];
int vis[105][105];
int sx, sy, tx, ty;
int dir[4][2] = { -1, 0, 0, -1, 0, 1, 1, 0 };
int n, m;

struct Node {
    int x, y, t;
    Node(int x, int y, int t) : x(x), y(y), t(t) {}
};

void bfs() {
    queue<Node> que;
    que.push(Node(sx, sy, 0));
    vis[sx][sy] = 1;
    while (!que.empty()) {
        Node p = que.front();
        if (p.x == tx && p.y == ty) {
            printf("%d", p.t);
            return;
        }
        que.pop();
        for (int i = 0; i < 4; ++i) {
            int x = p.x + dir[i][0];
            int y = p.y + dir[i][1];
            if (x >= 0 && x < n && y >= 0 && y < m && !vis[x][y] && mp[x][y] != '#') {
                que.push(Node(x, y, p.t + 1));
                vis[x][y] = 1;
            }
        }
    }
}

int main() {
    memset(vis, 0, sizeof(vis));
    scanf("%d%d", &n, &m);
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            scanf(" %c", &mp[i][j]);
            if (mp[i][j] == 'S') {
                sx = i;
                sy = j;
            }
            if (mp[i][j] == 'T') {
                tx = i;
                ty = j;
            }
        }
    }
    bfs();
    return 0;
}
