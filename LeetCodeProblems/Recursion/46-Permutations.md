# 46. Permutations - Medium
**全排列**

给定一个没有重复数字的序列，返回其所有可能的全排列。

示例:

```
输入: [1,2,3]
输出:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]
```

**可能解法**

- recursion

**CODINNG**

```
// 这种方法采用的是位置两两交换，交换后出现一种新的组合，将这种新的组合添加到中间集，再将中间集添加到结果集中。
class Solution {
    func swap(_ nums: inout [Int], _ a: Int, _ b: Int) -> Void {
        let temp = nums[a]
        nums[a] = nums[b]
        nums[b] = temp
    }

    func _permute(_ nums: inout [Int], _ result: inout [[Int]], _ cur: Int) -> Void {
        if nums.count == cur {
            result.append(nums)
        } else if cur <= nums.count {
            for i in cur..<nums.count {
                swap(&nums, cur, i)
                _permute(&nums, &result, cur + 1)
                swap(&nums, cur, i)
            }
        }
    }

    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return [nums]
        }

        var result = [[Int]]()
        var localNums = nums
        _permute(&localNums, &result, 0)
        return result
    }
}

```
