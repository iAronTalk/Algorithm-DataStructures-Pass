import UIKit

/*
 输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数位于数组的前半部分，所有偶数位于数组的后半部分。
 示例：

 输入：nums = [1,2,3,4]
 输出：[1,3,2,4]
 注：[3,1,2,4] 也是正确的答案之一。

 提示：
 1 <= nums.length <= 50000
 1 <= nums[i] <= 10000

 */

class Solution {
    func exchange(_ nums: [Int]) -> [Int] {
        guard nums.count != 0 else {
            return []
        }
        var nums = nums
        var index = 0
        for num in nums {
            if num & 1 == 0 {
                let delete = nums.remove(at: nums.index(nums.startIndex, offsetBy: index))
                nums.append(delete)
            } else {
                index += 1
            }
        }
        return nums
    }
    func exchange2(_ nums: [Int]) -> [Int] {
        guard nums.count != 0 else {
            return []
        }
        var nums = nums
        var index = 0
        var evenNums = [Int]()
        for num in nums {
            if num & 1 == 0 {
                let delete = nums.remove(at: nums.index(nums.startIndex, offsetBy: index))
                evenNums.append(delete)
            }
            index += 1
        }
        nums += evenNums
        return nums
    }
    
    func exchange3(_ nums: [Int]) -> [Int] {
         guard nums.count != 0 else {
            return []
        }
        var left = 0
        var right = nums.count - 1
        var nums = nums
        while left < right {
            if nums[left] & 1 == 1 {
                left += 1
                continue
            }
            if nums[right] & 1 == 0 {
                right -= 1
                continue
            }
            nums.swapAt(left, right)
        }
        return nums
    }
}
