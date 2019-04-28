# 240. Search a 2D Matrix II - Medium
**搜索二维矩阵 II**

编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target。该矩阵具有以下特性：

每行的元素从左到右升序排列。
每列的元素从上到下升序排列。

```
示例:
现有矩阵 matrix 如下：

[
  [1,   4,  7, 11, 15],
  [2,   5,  8, 12, 19],
  [3,   6,  9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
]
给定 target = 5，返回 true。

给定 target = 20，返回 false。
```

**可能解法**

- 暴利解法，两层for循环
- 分治，从矩阵右上角向左下角遍历，
  右上角的值 > target ，那么竖排全部不满足条件，向前缩进一列。
  右上角的值 < target ，那么横排全部不满足条件，向下进一行。
  只能从右上角开始，其他无解。（本题采用的思路）

**CODINNG**

```
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 {
            return false
        }

        let m = matrix.count //多少行
        let n = matrix.first!.count //多少列

        var i = 0 //记录行
        var j = n - 1 //记录列
        while i < m && j >= 0 {
            let number = matrix[i][j]
            if number > target {
                j -= 1
            } else if number < target {
                i += 1
            } else {
                return true
            }
        }

        return false
    }
}
```
