import UIKit

/*
 数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。
 你可以假设数组是非空的，并且给定的数组总是存在多数元素。
 示例 1:
 输入: [1, 2, 3, 2, 2, 2, 5, 4, 2]
 输出: 2

 限制：

 1 <= 数组长度 <= 50000
 注意：本题与主站 169 题相同：https://leetcode-cn.com/problems/majority-element/
 */
//前提是有一个超过一半的数n，那么排序后，中间的数就是这个数。
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var nums = nums
        nums.sort()
        return nums[nums.count / 2]
    }
}

//摩尔投票法，前提也是纯在大数。
class Solution2 {
    func majorityElement(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var x = 0
        var votes = 0
        for num in nums {
            if votes == 0 {
                x = num
            }
            votes += num == x ? 1 : -1
        }
        return x
    }
}
