# 350. Intersection of Two Arrays II - Easy
**两个数组的交集 II**

给定两个数组，编写一个函数来计算它们的交集。

示例 1:

```
输入: nums1 = [1,2,2,1], nums2 = [2,2]
输出: [2,2]
示例 2:

输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
输出: [4,9]
说明：

输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
我们可以不考虑输出结果的顺序。
进阶:

如果给定的数组已经排好序呢？你将如何优化你的算法？
如果 nums1 的大小比 nums2 小很多，哪种方法更优？
如果 nums2 的元素存储在磁盘上，磁盘内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？
```
**可能解法**

- 双指针
- 常规排除

**CODINNG**

```
class Solution {
    //常规排除
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var res = [Int]()

        var localNums1 = nums1
        var localNums2 = nums2


        for item in localNums1 {
            if localNums2.contains(item) {
                let index = localNums2.firstIndex(of: item)
                localNums2.remove(at: index!)
                res.append(item)
            }
        }

        return res
    }

    //双指针
    func intersect2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nums1 = nums1.sorted()
        var nums2 = nums2.sorted()
        var res = [Int]()
        var i = 0, j = 0

        while i < nums1.count && j < nums2.count {
            if nums1[i] == nums2[j] {
                res.append(nums1[i])
                i += 1 ; j += 1
            } else if nums1[i] < nums2[j] {
                i += 1
            } else {
                j += 1
            }
        }
        return res
    }
}

```
