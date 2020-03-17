import UIKit

/*
 在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

 示例:
 现有矩阵 matrix 如下：

 [
   [1,   4,  7, 11, 15],
   [2,   5,  8, 12, 19],
   [3,   6,  9, 16, 22],
   [10, 13, 14, 17, 24],
   [18, 21, 23, 26, 30]
 ]
 给定 target = 5，返回 true。
 给定 target = 20，返回 false。

 限制：

 0 <= n <= 1000

 0 <= m <= 1000

 链接：https://leetcode-cn.com/problems/er-wei-shu-zu-zhong-de-cha-zhao-lcof

 */
//此种办法跟题解思路是一致的，时间复杂度也相差不多。O(m + n)
 class Solution {
     func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 else {
            return false
        }

        var right = Int.max
        for row in 0..<matrix.count {
            let matrixRow = matrix[row]
            for col in (0..<matrixRow.count).reversed() {
                if col >= right {
                    continue
                }
                if matrixRow[col] > target {
                    right = col
                }
                if matrixRow[col] == target {
                    return true
                }
            }
        }
        return false
     }
 }

let s = Solution()
let r = s.findNumberIn2DArray([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 5)
print(r)
