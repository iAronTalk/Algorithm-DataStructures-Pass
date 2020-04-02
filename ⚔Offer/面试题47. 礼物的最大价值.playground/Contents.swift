import UIKit

/*
 在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？
 示例 1:

 输入:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 输出: 12
 解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物
 提示：

 0 < grid.length <= 200
 0 < grid[0].length <= 200
 */

//dp[m][n] = max(dp[m][n-1],dp[m-1][n]) + grid[m][n]
class Solution {
    func maxValue(_ grid: [[Int]]) -> Int {
        if grid.count == 0 {
            return 0
        }
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: grid.first!.count), count: grid.count)
        for m in (0..<grid.count) {
            for n in (0..<grid.first!.count) {
                if m - 1 >= 0 && n - 1 >= 0 {
                    dp[m][n] = max(dp[m-1][n], dp[m][n-1]) + grid[m][n]
                } else if m - 1 < 0 && n - 1 >= 0 {
                    dp[m][n] = dp[m][n-1] + grid[m][n]
                } else if n - 1 < 0 && m - 1 >= 0 {
                    dp[m][n] = dp[m-1][n] + grid[m][n]
                } else {
                    dp[m][n] = grid[m][n]
                }
            }
        }
        return dp[grid.count - 1][grid.first!.count - 1]
    }
}
