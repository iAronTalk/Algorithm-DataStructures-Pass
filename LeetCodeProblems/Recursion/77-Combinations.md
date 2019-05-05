# 77. Combinations - Medium
**组合**

给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。

示例:

```
输入: n = 4, k = 2
输出:
[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]
```

**可能解法**

- recursion

**CODINNG**

```
class Solution {
    func _combine(_ n: Int, _ k: Int, _ start: Int, _ nums: inout [Int], _ result: inout [[Int]]) -> Void {
        if nums.count == k {
            result.append(nums)
            return
        }

        if start <= n {
            for i in start...n {
                nums.append(i)
                _combine(n, k, i + 1, &nums, &result)
                nums.removeLast()
            }
        }

    }

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        var nums = [Int]()

        if k < 0 || n < 0 || n < k {
            return result
        }

        _combine(n, k, 1, &nums, &result)
        return result
    }
}
```
