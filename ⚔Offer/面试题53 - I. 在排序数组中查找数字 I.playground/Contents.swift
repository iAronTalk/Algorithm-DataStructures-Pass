import UIKit

/*
 统计一个数字在排序数组中出现的次数。
 示例 1:

 输入: nums = [5,7,7,8,8,10], target = 8
 输出: 2
 示例 2:

 输入: nums = [5,7,7,8,8,10], target = 6
 输出: 0

 限制：

 0 <= 数组长度 <= 50000
 */
//找到中间的值，然后中间向着两侧扩散
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return nums.count
        }
        var low = 0
        var high = nums.count - 1
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] > target {
                high = mid - 1
            } else if nums[mid] < target {
                low = mid + 1
            } else {
                low = mid
                high = mid
                while low >= 0 && nums[low] == target {
                    low -= 1
                }
                while high <= nums.count - 1 && nums[high] == target {
                    high += 1
                }
                return (high - low) > 0 ? high - low - 1 : 1
            }
        }
        if high == low && nums[low] == target {return 1}
        return 0
    }
}

//直接找左右边界
class Solution2 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return nums.count
        }
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if nums[mid] >= target {
                high = mid - 1
            } else if nums[mid] < target {
                low = mid + 1
            }
        }
        let left = high
        low = 0
        high = nums.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if nums[mid] > target {
                high = mid - 1
            } else if nums[mid] <= target {
                low = mid + 1
            }
        }
        let right = low

        return right - left - 1
    }
}

