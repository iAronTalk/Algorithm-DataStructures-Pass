# 27-Remove Element - Easy
**移除元素**

给定一个数组 nums 和一个值 val，你需要原地移除所有数值等于 val 的元素，返回移除后数组的新长度。

不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。

元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。

示例 1:
```
给定 nums = [3,2,2,3], val = 3,
函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。
你不需要考虑数组中超出新长度后面的元素。
```
**所有可能解法**

- 删除多余的元素，计数指针不移动，无赋值操作，返回最后的总数。
- 先前赋值，返回计数指针。

**CODINNG**

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {

        if nums.count <= 1 {
            return nums.count
        }
        var i = 0
        var j = 1
        while j < nums.count {
            if nums[i] != nums[j] {
                i = i + 1
                j = j + 1
            } else {
                nums.remove(at: j)
            }
        }
        return i + 1
    }
}
```
