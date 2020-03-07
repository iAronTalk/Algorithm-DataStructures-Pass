# 200. Number of Islands - Medium
给定一个由 '1'（陆地）和 '0'（水）组成的的二维网格，计算岛屿的数量。一个岛被水包围，并且它是通过水平方向或垂直方向上相邻的陆地连接而成的。你可以假设网格的四个边均被水包围。

示例 1:

输入:
11110
11010
11000
00000

输出: 1
示例 2:

输入:
11000
11000
00100
00011

输出: 3


**可能解法**

- BFS

**CODINNG**

*BFS-解法一* 小数据级的测试用例可以通过，leetcode中有非常多变态的高数量及的测试用例，进化为方法二。
```
class Solution {
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    struct Node: Equatable {
        var col: Int
        var row: Int
        init(_ row: Int, _ col: Int) {
            self.col = col
            self.row = row
        }
        static func ==(lhs: Node, rhs: Node) -> Bool {
            return (lhs.row == rhs.row) && (lhs.col == rhs.col)
        }
    }
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.count == 0 {
            return 0
        }

        var res = 0
        var queue = [Node]()
        var visited = [Node]()
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                let cur = grid[row][col]
                if cur == "1" {
                    if visited.contains(Node.init(row, col)) {
                        continue
                    } else {
                        visited.append(Node.init(row, col))
                        queue.append(Node.init(row, col))
                        while !queue.isEmpty {
                            let node = queue.removeFirst()
                            for i in 0...3 {
                                let drow = node.row + dx[i]
                                let dcol = node.col + dy[i]
                                if (drow >= 0 && drow < grid.count) && (dcol >= 0 && dcol < grid[0].count) {
                                    let dchar = grid[drow][dcol]
                                    if dchar == "1" && !visited.contains(Node.init(drow, dcol)) {
                                        queue.append(Node.init(drow, dcol))
                                        visited.append(Node.init(drow, dcol))
                                    }
                                }
                            }
                        }
                        res += 1
                    }
                }
            }
        }
        return res
    }
}
```
*方法二*访问过的岛屿设置为2，可以通过leetcode全部测试用例。
```
class Solution {
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
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.count == 0 {
            return 0
        }
        var grid = grid
        var res = 0
        var queue = [Node]()
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                let cur = grid[row][col]
                if cur == "1" {
                    grid[row][col] = "2"
                    queue.append(Node.init(row, col))
                    while !queue.isEmpty {
                        let node = queue.removeFirst()
                        for i in 0...3 {
                            let drow = node.row + dx[i]
                            let dcol = node.col + dy[i]
                            if (drow >= 0 && drow < grid.count) && (dcol >= 0 && dcol < grid[0].count) {
                                let dchar = grid[drow][dcol]
                                if dchar == "1" && dchar != "2" {
                                    grid[drow][dcol] = "2"
                                    queue.append(Node.init(drow, dcol))
                                }
                            }
                        }
                    }
                    res += 1
                }
            }
        }
        return res
    }
}
```
