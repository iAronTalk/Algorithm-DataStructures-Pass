import UIKit

/*
 实现函数double Power(double base, int exponent)，求base的exponent次方。不得使用库函数，同时不需要考虑大数问题。

 示例 1:
 输入: 2.00000, 10
 输出: 1024.00000
 
 示例 2:
 输入: 2.10000, 3
 输出: 9.26100
 
 示例 3:
 输入: 2.00000, -2
 输出: 0.25000
 解释: 2-2 = 1/22 = 1/4 = 0.25
 
 说明:
 -100.0 < x < 100.0
 n 是 32 位有符号整数，其数值范围是 [−231, 231 − 1] 。
 注意：本题与主站 50 题相同：https://leetcode-cn.com/problems/powx-n/
 */
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        }
        var x = x
        var n = n
        
        if n < 0 {
            return myPow(1 / x, -n)
        }
        while n > 0 {
            if n & 1 == 1 {
                return x * myPow(x, n - 1)
            }
            x = x * x
            n >>= 1
        }
        return x
    }
}
