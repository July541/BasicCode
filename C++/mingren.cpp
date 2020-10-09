/*
已知一张地图（以二维矩阵的形式表示）以及佐助和鸣人的位置。
地图上的每个位置都可以走到，只不过有些位置上有大蛇丸的手下，需要先打败大蛇丸的手下才能到这些位置。
鸣人有一定数量的查克拉，每一个单位的查克拉可以打败一个大蛇丸的手下。
假设鸣人可以往上下左右四个方向移动，每移动一个距离需要花费1个单位时间，打败大蛇丸的手下不需要时间。
如果鸣人查克拉消耗完了，则只可以走到没有大蛇丸手下的位置，不可以再移动到有大蛇丸手下的位置。
佐助在此期间不移动，大蛇丸的手下也不移动。请问，鸣人要追上佐助最少需要花费多少时间？

输入
输入的第一行包含三个整数：M，N，T。代表M行N列的地图和鸣人初始的查克拉数量T。0 < M,N < 200，0 ≤ T < 10
后面是M行N列的地图，其中@代表鸣人，+代表佐助。*代表通路，#代表大蛇丸的手下。
输出
输出包含一个整数R，代表鸣人追上佐助最少需要花费的时间。如果鸣人无法追上佐助，则输出-1。
*/

#include <bits/stdc++.h>

using namespace std;

int M, N, T;
char mp[205][205];
int vis[205][205];
int sx, sy, tx, ty;
int dir[4][2] = { -1, 0, 0, -1, 0, 1, 1, 0 };

struct Node {
    int x, y, c, t;
    Node(int x, int y, int c, int t) : x(x), y(y), c(c), t(t) {}
    friend bool operator <(Node n1, Node n2) {
        if (n1.t == n2.t)
            return n1.c < n2.c;
        return n1.t > n2.t;
    }
};

void bfs() {
    priority_queue<Node> que;
    vis[sx][sy] = 1;
    que.push(Node(sx, sy, T, 0));
    while (!que.empty()) {
        Node n = que.top();
        if (n.x == tx && n.y == ty) {
            printf("%d", n.t);
            return;
        }
        que.pop();
        for (int i = 0; i < 4; ++i) {
            int x = n.x + dir[i][0];
            int y = n.y + dir[i][1];
            if (x >= 0 && x < M && y >= 0 && y < N && !vis[x][y]) {
                if (mp[x][y] != '#') {
                    vis[x][y] = 1;
                    que.push(Node(x, y, n.c, n.t + 1));
                }
                else if (n.c > 0) {
                    vis[x][y] = 1;
                    que.push(Node(x, y, n.c - 1, n.t + 1));
                }
            }
        }
    }
    printf("-1");
}

int main() {
    memset(vis, 0, sizeof(vis));
    scanf("%d%d%d", &M, &N, &T);
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf(" %c", &mp[i][j]);
            if (mp[i][j] == '@') {
                sx = i;
                sy = j;
            }
            if (mp[i][j] == '+') {
                tx = i;
                ty = j;
            }
        }
    }
    bfs();
    return 0;
}
