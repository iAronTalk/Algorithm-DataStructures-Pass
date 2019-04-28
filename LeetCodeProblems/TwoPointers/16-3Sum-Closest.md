# 16. 3Sum Closest - Medium
**最接近的三数之和**

给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。

```
例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.

与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
```

**可能解法**

与leetcode 15题类似。
- 暴力解法，双层循环，O(n^3)。
- 一层遍历，然后双指针，O(n^2)，本例使用解法。

**CODINNG**

```
cclass Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return 0
        }

        let sortedNums = nums.sorted {$0 < $1}
        var sum = 0
        var minGap = Int.max
        for i in 0...(sortedNums.count - 1) {
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }

            if i >= sortedNums.count - 2 {
                break
            }

            var left = i + 1
            var right = sortedNums.count - 1

            while left < right {
                let tempSum = sortedNums[i] + sortedNums[left] + sortedNums[right]
                let tempSumClosest = abs(tempSum - target)
                if tempSum < target {
                    if tempSumClosest < minGap {
                        minGap = tempSumClosest
                        sum = tempSum
                    }
                    left += 1
                } else if tempSum > target {
                    if tempSumClosest < minGap {
                        minGap = tempSumClosest
                        sum = tempSum
                    }
                    right -= 1
                } else {
                    //tempSum = target
                    sum = target
                    return sum
                }
            }
        }
        return sum
    }
}

```
