import UIKit
/*
 请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以从矩阵中的任意一格开始，每一步可以在矩阵中向左、右、上、下移动一格。如果一条路径经过了矩阵的某一格，那么该路径不能再次进入该格子。例如，在下面的3×4的矩阵中包含一条字符串“bfce”的路径（路径中的字母用加粗标出）。

 [["a","b","c","e"],
 ["s","f","c","s"],
 ["a","d","e","e"]]

 但矩阵中不包含字符串“abfb”的路径，因为字符串的第一个字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。

 示例 1：
 输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 输出：true
 
 示例 2：
 输入：board = [["a","b"],["c","d"]], word = "abcd"
 输出：false
 提示：

 1 <= board.length <= 200
 1 <= board[i].length <= 200
 注意：本题与主站 79 题相同：https://leetcode-cn.com/problems/word-search/
 */

//注意：
/*
 1.注意使用visited处理访问过的位置(这里使用一个小技巧，记录元素的序号)
 2.注意边界判断
 3.注意hasPath的循环终止条件，即if pathLength == word.count { return true } 位置。
 */
class Solution {
    let dx = [0,1,0,-1]
    let dy = [1,0,-1,0]
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0 && word.count > 0 else {
            return false
        }
        var visited = [Int]()
        for i in 0..<board.count {
            for j in 0..<board.first!.count {
                if hasPath(board, i, j, word, 0, visited) {
                    return true
                }
                visited.removeAll()
            }
        }
        return false
    }
    
    func hasPath(_ board: [[Character]], _ row: Int, _ col: Int, _ word: String, _ pathLength: Int, _ visited: [Int]) -> Bool {
        let cur = board[row][col]
        let char = word[word.index(word.startIndex, offsetBy: pathLength)]
        var visited = visited
        var pathLength = pathLength
        if cur == char {
            visited.append(row * board.first!.count + col)
            pathLength += 1
            if pathLength == word.count {
                return true
            }
            for index in 0...3 {
                let newRow = row + dx[index]
                let newCol = col + dy[index]
                if newRow >= 0 && newRow < board.count && newCol >= 0 && newCol < board.first!.count {
                    if visited.contains(newRow * board.first!.count + newCol) {
                        continue
                    }
                    if hasPath(board, newRow, newCol, word, pathLength, visited) {
                        return true
                    }
                }
            }
        } else {
            return false
        }
        return false
    }
}
