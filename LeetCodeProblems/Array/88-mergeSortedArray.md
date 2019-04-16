# 88. Merge Sorted Array - Easy
**合并两个有序数组**

给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。

说明:
初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。

**示例:**
```
输入:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

输出: [1,2,2,3,5,6]
```
**所有可能解法**

- 常规比较插入

**CODINNG**

```
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = 0, j = 0
        while i <= m && j <= n {
            if i == m && j < n {
                nums1[i + j] = nums2[j]
                j = j + 1
            } else if j == n {
                return
            } else if nums1[i + j] > nums2[j] {
                nums1.insert(nums2[j], at: i + j)
                nums1.removeLast()
                j = j + 1
            } else {
                i = i + 1
            }
        }
    }
}
```
