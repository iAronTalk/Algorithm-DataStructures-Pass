# 283. Move zeroes - Easy
** 移动零**

给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

```
示例:

输入: [0,1,0,3,12]
输出: [1,3,12,0,0]
说明:

必须在原数组上操作，不能拷贝额外的数组。
尽量减少操作次数。
```
**可能解法**
- 没什么难度，过。

**CODINNG**

```
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count == 0 {
            return
        }
        var notZeroIndex = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums[notZeroIndex] = nums[i]
                notZeroIndex += 1
            }
        }
        while notZeroIndex < nums.count {
            nums[notZeroIndex] = 0
            notZeroIndex += 1
        }
    }
}
```
