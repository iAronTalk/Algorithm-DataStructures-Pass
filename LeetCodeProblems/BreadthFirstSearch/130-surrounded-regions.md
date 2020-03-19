# 120. Surrounded Regions - Medium

*130. 被围绕的区域**
给定一个二维的矩阵，包含 'X' 和 'O'（字母 O）。

找到所有被 'X' 围绕的区域，并将这些区域里所有的 'O' 用 'X' 填充。

示例:

X X X X
X O O X
X X O X
X O X X
运行你的函数后，矩阵变为：

X X X X
X X X X
X X X X
X O X X
解释:

被围绕的区间不会存在于边界上，换句话说，任何边界上的 'O' 都不会被填充为 'X'。 任何不在边界上，或不与边界上的 'O' 相连的 'O' 最终都会被填充为 'X'。如果两个元素在水平或垂直方向相邻，则称它们是“相连”的。

**可能解法**

- BFS
- DFS
**CODINNG**

*BFS-解法一* 这道题的结题核心是要从边缘入手，因为所有跟边缘链接的O都要保留住，我们这里使用#对其保留。剩下的O都是需要被X掉。
```
class Solution11 {
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    struct Node: Equatable {
        var col: Int
        var row: Int
        init(_ row: Int, _ col: Int) {
            self.col = col
            self.row = row
        }
    }

    func solve(_ board: inout [[Character]]) {
        if board.count == 0 {
            return
        }
        var queue = [Node]()
        var visited = [Node]()
        //全局遍历找边缘0点。
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                let cur = board[row][col]
                if (row == 0 || row == board.count - 1 || col == 0 || col == board[0].count - 1) &&
                     cur == "O" {
                    board[row][col] = "#"
                    queue.append(Node.init(row, col))
                    while !queue.isEmpty {
                        let node = queue.removeFirst()
                        for i in 0...3 {
                            let drow = node.row + dx[i]
                            let dcol = node.col + dy[i]
                            if (drow >= 0 && drow <= board.count - 1) && (dcol >= 0 && dcol <= board[0].count - 1) {
                                let dchar = board[drow][dcol]
                                if dchar == "O" {
                                    board[drow][dcol] = "#"
                                    queue.append(Node.init(drow, dcol))
                                }
                            }
                        }
                    }
                }
            }
        }

        //最后将所有的#变化为原来的O
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                let char = board[row][col]
                 if char == "#" {
                    board[row][col] = "O"
                 } else if char == "O" {
                    board[row][col] = "X"
                }
            }
        }
    }
}
```
