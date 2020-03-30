import UIKit

/*
 数字以0123456789101112131415…的格式序列化到一个字符序列中。在这个序列中，第5位（从下标0开始计数）是5，第13位是1，第19位是4，等等。

 请写一个函数，求任意第n位对应的数字。
 示例 1：

 输入：n = 3
 输出：3
 示例 2：

 输入：n = 11
 输出：0
  

 限制：

 0 <= n < 2^31
 */

class Solution {
    func findNthDigit(_ n: Int) -> Int {
        if n < 0 {
            return -1
        }
        var n = n
        var digits = 1
        while true {
            let numbers = countOfIntegers(digits)
            if n < numbers * digits {
                return digitAtIndex(n, digits)
            }
            n -= numbers * digits //减去前面的digits位的数
            digits += 1
        }
    }
    
    //计算digits位有多少个数
    func countOfIntegers(_ digits: Int) -> Int {
        if digits == 1 {
            return 10
        } else {
            return 9 * Int(pow(Double(10.0), Double(digits - 1)))
        }
    }
    
    //把小于digit位的数都减掉之后，剩下的多少的位置要查询。
    func digitAtIndex(_ n: Int, _ digits: Int) -> Int {
        var number = beginNumber(digits) + n / digits //找到n这个位置应该在哪个数值里面
        let indexFromRight = digits - n % digits //n这个位置在number这个数值中的从右数的位置
        if indexFromRight >= 1 {
            for _ in 1..<indexFromRight {
                number /= 10
            }
        }
        return number % 10
    }
    //当前digit位数，开始的数字是多少
    func beginNumber(_ digits: Int) -> Int {
        if digits == 1 {
            return 0
        } else {
            return Int(pow(Double(10), Double(digits - 1)))
        }
    }
}
