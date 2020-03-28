import UIKit

/*
 一个整型数组 nums 里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。

 示例 1：

 输入：nums = [4,1,4,6]
 输出：[1,6] 或 [6,1]
 示例 2：

 输入：nums = [1,2,10,4,1,4,3,3]
 输出：[2,10] 或 [10,2]
  
 限制：
 2 <= nums <= 10000
 */

//发现广大开发者给出的答案很多时候要比剑指offer书给出来的解法更加易懂，简单。
class Solution {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        if nums.count == 0 {
            return []
        }
        var res = 0
        for num in nums {
            res ^= num
        }
        var h = 1
        while res & h == 0 {
            h <<= 1
        }
        var a = 0
        var b = 0
        for num in nums {
            if num ^ h == 0 {
                a ^= num
            } else {
                b ^= num
            }
        }
        return[a, b]
    }
}
