# 78. Subsets - Medium
**子集 II**

给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

说明：解集不能包含重复的子集。

示例:

```
输入: nums = [1,2,3]
输出:
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]
```

**可能解法**

- 位运算
- dfs

**CODINNG**

*位运算*，详细解答参考：![详细解答参考](https://blog.csdn.net/gh6267/article/details/88116764)
```
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return [[]]
        }
        
        var res = [[Int]]()
        var temp = [Int]()
        let all = 1 << nums.count
        for i in 1...all {
            for j in 0..<nums.count {
                if (i & (1 << j)) != 0 {
                    temp.append(nums[j])
                }
            }
            res.append(temp)
            temp.removeAll()
        }

        return res
    }
}
```

*dfs*
```
class Solution {
    func _dfs(_ nums: [Int], _ temp: inout [Int], res: inout [[Int]], _ level: Int) -> Void {
        res.append(temp)
        if level < nums.count {
            for i in level..<nums.count {
                temp.append(nums[i])
                _dfs(nums, &temp, res: &res, i + 1)
                temp.removeLast()
            }
        }
    }

    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return [[]]
        }
        var res = [[Int]]()
        var temp = [Int]()
        _dfs(nums, &temp, res: &res, 0)
        return res
    }
}

```
