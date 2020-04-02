import UIKit
/*
 我们把只包含因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。
 示例:

 输入: n = 10
 输出: 12
 解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。
 说明:

 1 是丑数。
 n 不超过1690。
 注意：本题与主站 264 题相同：https://leetcode-cn.com/problems/ugly-number-ii/
 */

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        var dp = [Int].init(repeating: 1, count: n)
        var a = 0, b = 0, c = 0 //a、b、c表示前面可以通过乘以2、3、5得到下一个的丑数的【坐标】，依次增长，可以保证前面所有通过乘以2或者3或者5的数都可以遍历到。
        for index in 1..<n {
            let n1 = dp[a] * 2, n2 = dp[b] * 3, n3 = dp[c] * 5
            dp[index] = min(n1, n2, n3)
            if dp[index] == n1 {
                a += 1
            }
            if dp[index] == n2 {
                b += 1
            }
            if dp[index] == n3 {
                c += 1
            }
        }
        return dp[ n - 1]
    }
}
