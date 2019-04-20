# 80-Remove Duplicates from Sorted Array II - Medium
**删除排序数组中的重复项 II**

给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素最多出现两次，返回移除后数组的新长度。

不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。

```
示例 1:
给定 nums = [1,1,1,2,2,3],
函数应返回新长度 length = 5, 并且原数组的前五个元素被修改为 1, 1, 2, 2, 3 。
你不需要考虑数组中超出新长度后面的元素。
```
**所有可能解法**

- 删除多余的元素，计数指针不移动，无赋值操作，返回最后的总数。
- 先前赋值，返回计数指针。

**CODINNG**

```
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {

        var index = 0
        var originalCount = nums.count
        while index < originalCount {
            if val == nums[index] {
                nums.remove(at: index)
                originalCount = originalCount - 1
            } else {
                index = index + 1
            }
        }
        return nums.count
    }
}

```
