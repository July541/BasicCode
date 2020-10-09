#include <bits/stdc++.h>

using namespace std;

int mp[65][1288][130];
int vis[65][1288][130];
int m, n, l, t;
int dir[6][3] = { -1, 0, 0, 0, -1, 0, 0, 0, -1, 0, 0, 1, 0, 1, 0, 1, 0, 0 };
int res = 0;
int c;

void dfs(int cx, int cy, int cl) {
    for (int i = 0; i < 6; ++i) {
        int x = cx + dir[i][1];
        int y = cy + dir[i][2];
        int z = cl + dir[i][0];
        if (x >= 0 && x < m && y >= 0 && y < n && z >= 0 && z < l && !vis[z][x][y] && mp[z][x][y] == 1) {
            vis[z][x][y] = 1;
            ++c;
            dfs(x, y, z);
        }
    }
}

int main() {
    scanf("%d%d%d%d", &m, &n, &l, &t);
    memset(vis, 0, sizeof(vis));
    for (int i = 0; i < l; ++i) {
        for (int j = 0; j < m; ++j) {
            for (int k = 0; k < n; ++k) {
                scanf("%d", &mp[i][j][k]);
            }
        }
    }
    for (int i = 0; i < l; ++i) {
        for (int j = 0; j < m; ++j) {
            for (int k = 0; k < n; ++k) {
                if (!vis[i][j][k] && mp[i][j][k] == 1) {
                    vis[i][j][k] = 1;
                    c = 1;
                    dfs(j, k, i);
                    if (c >= t)
                        res += c;
                }
            }
        }
    }
    printf("%d", res);
    return 0;
}
