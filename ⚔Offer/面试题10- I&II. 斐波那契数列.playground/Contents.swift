import UIKit

/*
 写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项。斐波那契数列的定义如下：

 F(0) = 0,   F(1) = 1
 F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
 斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。
 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
 示例 1：

 输入：n = 2
 输出：1
 示例 2：

 输入：n = 5
 输出：5

 提示：
 0 <= n <= 100
 */
class Solution {
    func fib(_ n: Int) -> Int {
        var visited = [Int].init(repeating: 0, count: n + 1)
        if n == 0 || n == 1 {
            return n
        }
        visited[0] = 0
        visited[1] = 1
        for index in 2...n {
            visited[index] = (visited[index - 1] + visited[index - 2]) % 1000000007
        }
        return visited[n]
    }
}

let s = Solution()
let r = s.fib(100)
print(r)

/*
 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。
 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
 示例 1：
 输入：n = 2
 输出：2
 示例 2：
 输入：n = 7
 输出：21
 提示：
 0 <= n <= 100
 */
class Solution2 {
    func numWays(_ n: Int) -> Int {
        var visited = [Int].init(repeating: 0, count: n + 1)
        if n == 0 || n == 1 {
            return 1
        }
        visited[0] = 1
        visited[1] = 1
        for index in 2...n {
            visited[index] = (visited[index - 1] + visited[index - 2]) % 1000000007
        }
        return visited[n]
    }
}
