# 349. Intersection of Two Arrays - Easy
**两个数组的交集**

给定两个数组，编写一个函数来计算它们的交集。

示例 1:

```
输入: nums1 = [1,2,2,1], nums2 = [2,2]
输出: [2]
示例 2:

输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
输出: [9,4]
说明:

输出结果中的每个元素一定是唯一的。
我们可以不考虑输出结果的顺序。
```

**可能解法**

- Set
- 常规排除
**CODINNG**

```
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var res = [Int]()
        for item in nums1 {
            if !res.contains(item) && nums2.contains(item) {
                res.append(item)
            }
        }
        return res
    }
}

```
