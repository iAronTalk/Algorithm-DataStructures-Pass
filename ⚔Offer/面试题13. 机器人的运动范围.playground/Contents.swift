import UIKit
/*
 地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？

 示例 1：
 输入：m = 2, n = 3, k = 1
 输出：3
 示例 1：

 输入：m = 3, n = 1, k = 0
 输出：1
 提示：

 1 <= n,m <= 100
 0 <= k <= 20
 */

//这里与12题关于visited处理不太一样，计算时间会增长，无法通过，这里通过二维数据把通过的位置设置为true。
class Solution {
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
        if m < 1 || n < 1 {
            return 0
        }
        var visited = [[Bool]].init(repeating: [Bool].init(repeating: false, count:n ), count: m)
        if caculate(0, 0, k) {
            return countStep(0, 0, k, m, n, &visited)
        }
        return 0
    }
    func countStep(_ m: Int, _ n: Int, _ k: Int, _ maxM: Int, _ maxN: Int, _ visited: inout [[Bool]]) -> Int {
        visited[m][n] = true
        var count = 1
        for index in 0...3 {
            let newM = m + dx[index]
            let newN = n + dy[index]
            if newM >= 0 && newM < maxM && newN >= 0 && newN < maxN {
                if !visited[newM][newN] && caculate(newM, newN, k) {
                    count  += countStep(newM, newN, k, maxM, maxN, &visited)
                }
            }
        }
        return count
    }
    
    func caculate(_ m: Int, _ n: Int, _ k: Int) -> Bool {
        var sumM = 0
        var sumN = 0
        var m = m
        var n = n
        while m > 0 {
            sumM += m % 10
            m = m / 10
        }
        while n > 0 {
            sumN += n % 10
            n = n / 10
        }
        if (sumM + sumN) > k {
            return false
        }
        return true
    }
}
