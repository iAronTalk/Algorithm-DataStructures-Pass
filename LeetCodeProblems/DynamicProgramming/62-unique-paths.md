# 62. Unique Paths - Medium
**不同路径**
一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。

机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。

问总共有多少条不同的路径？
例如，上图是一个7 x 3 的网格。有多少可能的路径？
```
示例 1:

输入: m = 3, n = 2
输出: 3
解释:
从左上角开始，总共有 3 条路径可以到达右下角。
1. 向右 -> 向右 -> 向下
2. 向右 -> 向下 -> 向右
3. 向下 -> 向右 -> 向右
```

**可能解法**
- DP

**CODINNG**

```
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m <= 0 || n <= 0 {
            return 0
        }
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: m)
        for i in 0..<n {//初始化第一行
            dp[0][i] = 1
        }
        for j in 0..<m {//初始化第一列
            dp[j][0] = 1
        }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }
        return dp[m-1][n-1]
    }
}
```
