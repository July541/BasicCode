/*
描述
马在中国象棋以日字形规则移动。

请编写一段程序，给定n*m大小的棋盘，以及马的初始位置(x，y)，要求不能重复经过棋盘上的同一个点，计算马可以有多少途径遍历棋盘上的所有点。

输入
第一行为整数T(T < 10)，表示测试数据组数。
每一组测试数据包含一行，为四个整数，分别为棋盘的大小以及初始位置坐标n,m,x,y。(0<=x<=n-1,0<=y<=m-1, m < 10, n < 10)
输出
每组测试数据包含一行，为一个整数，表示马能遍历棋盘的途径总数，0为无法遍历一次。
*/

#include <bits/stdc++.h>

using namespace std;

int vis[10][10];
int n, m, sx, sy;
int dir[8][2] = { -2, -1, -2, 1, -1, 2, 1, 2, 2, 1, 2, -1, 1, -2, -1, -2 };
int res = 0;

void dfs(int cx, int cy, int t) {
    if (t == n * m) {
        res++;
        return;
    }
    for (int i = 0; i < 8; ++i) {
        int x = cx + dir[i][0];
        int y = cy + dir[i][1];
        if (x >= 0 && x < n && y >= 0 && y < m && !vis[x][y]) {
            vis[x][y] = 1;
            dfs(x, y, t + 1);
            vis[x][y] = 0;
        }
    }
}

int main() {
    int T;
    scanf("%d", &T);
    while (T--) {
        memset(vis, 0, sizeof(vis));
        res = 0;
        scanf("%d%d%d%d", &n, &m, &sx, &sy);
        vis[sx][sy] = 1;
        dfs(sx, sy, 1);
        printf("%d\n", res);
    }
    return 0;
}
