import UIKit

// 面试题3（一）：找出数组中重复的数字
// 题目：在一个长度为n的数组里的所有数字都在0到n-1的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，
// 也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。例如，如果输入长度为7的数组{2, 3, 1, 0, 2, 5, 3}，
// 那么对应的输出是重复的数字2或者3。

class Solution {
    func duplicateNum(_ nums: [Int]?, _ length: Int, _ duplicate: inout Int) -> Bool {
        guard let safeNums = nums else { return false }
        if length <= 0 {
            return false
        }
        var nums = safeNums
        for num in nums {
            if (num > length - 1) || (num < 0) {
                return false
            }
        }

        for i in 0..<nums.count {
            while nums[i] != i {
                if nums[i] == nums[nums[i]] {
                    duplicate = nums[i]
                    return true
                }
                let tmp: Int = nums[i]
                nums[i] = nums[tmp]
                nums[tmp] = tmp
            }
        }
        return false
    }
}

let s = Solution()
var dup = -1
//let success = s.duplicateNum([1,3,4,5,8,5,4,2,1,0], 9, &dup)
//et success = s.duplicateNum([1,3,4,9,8,5,7,2,6,0], 9, &dup)
let success = s.duplicateNum([1,3,3,9,8,5,7,2,6,12], 9, &dup)
print(dup)
print(success)
