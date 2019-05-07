# 39. Combination Sum - Medium
**组合总和**

给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
candidates 中的数字可以无限制重复被选取。

说明：
所有数字（包括 target）都是正整数。
解集不能包含重复的组合。

```
示例 1:

输入: candidates = [2,3,6,7], target = 7,
所求解集为:
[
  [7],
  [2,2,3]
]
示例 2:

输入: candidates = [2,3,5], target = 8,
所求解集为:
[
  [2,2,2,2],
  [2,3,3],
  [3,5]
]
```

**可能解法**

- 回溯，DFS

**CODINNG**

```
class Solution {

    var visited = [[Int]]()
    var res = [[Int]]()
    var temp = [Int]()

    func _dfs(_ candidatess: [Int], _ target: Int, _ left: Int, _ right: Int) {

        if 0 == target {
            res.append(temp)
            return
        } else if target < 0 {
            return
        }

        for j in left...right {
            temp.append(candidatess[j])
            _dfs(candidatess, target - candidatess[j], j, right)  //left的设置，避免了2，3和3，2这种情况。
            temp.removeLast()
        }
    }

    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {

        _dfs(candidates, target, 0, candidates.count - 1)
        return res

    }
}


```
