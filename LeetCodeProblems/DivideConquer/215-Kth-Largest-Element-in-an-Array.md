# 215. Kth Largest Element in an Array - Medium
**数组中的第K个最大元素**

在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

示例:

```
输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
输出: 4
```

**可能解法**

- 分治

**CODINNG**

```
class Solution {
  func quickSort(_ nums: [Int]) -> [Int] {
      if nums.count == 0 {
          return []
      }
      var localArray = nums
      let mid = localArray[localArray.count / 2]
      localArray.remove(at: localArray.count / 2)

      var left = [Int]()
      var right = [Int]()
      for item in localArray {
          if item < mid {
              left.append(item)
          } else {
              right.append(item)
          }
      }
      
      return quickSort(left) + [mid] + quickSort(right)
  }


  func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
      let sortedNums = quickSort(nums)
      let count = sortedNums.count
      return sortedNums[count - k]
  }
}
```
