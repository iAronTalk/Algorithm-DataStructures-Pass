import UIKit

/*
 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。

 示例 1：
 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 示例 2：
 输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 输出：[1,2,3,4,8,12,11,10,9,5,6,7]
  
 限制：
 0 <= matrix.length <= 100
 0 <= matrix[i].length <= 100
 */

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0 else {
            return []
        }
        var left = 0
        var right = matrix.first!.count - 1
        var top = 0
        var bottom = matrix.count - 1
        var res = [Int]()
        while true {
            //left to right
            for i in left...right {
                res.append(matrix[top][i])
            }
            top += 1
            if top > bottom {
                break
            }
            //top to bottom
            for i in top...bottom {
                res.append(matrix[i][right])
            }
            right -= 1
            if left > right {
                break
            }
            //right to left
            for i in (left...right).reversed() {
                res.append(matrix[bottom][i])
            }
            bottom -= 1
            if top > bottom {
                break
            }
            //bottom to top
            for i in (top...bottom).reversed() {
                res.append(matrix[i][left])
            }
            left += 1
            if left > right {
                break
            }
        }
        return res
    }
}
