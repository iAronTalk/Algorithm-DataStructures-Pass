# 35. Search Insert Position - Easy
**搜索插入位置**
给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

你可以假设数组中无重复元素。

**可能解法**

- 暴力解法，从头遍历。
- 二分，降低复杂度

**CODINNG**

```
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }

        var left = 0
        var right = nums.count - 1
        var middle = 0

        while left <= right {
            middle = (left + right) / 2
            if nums[middle] < target {
                left = middle + 1
            } else if nums[middle] > target {
                right = middle - 1
            } else {
                return middle
            }
        }

        return left
    }
}
```
