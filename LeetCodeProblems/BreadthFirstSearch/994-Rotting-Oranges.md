# 994. Rotting Oranges - Easy
In a given grid, each cell can have one of three values:

the value 0 representing an empty cell;
the value 1 representing a fresh orange;
the value 2 representing a rotten orange.
Every minute, any fresh orange that is adjacent (4-directionally) to a rotten orange becomes rotten.

Return the minimum number of minutes that must elapse until no cell has a fresh orange.  If this is impossible, return -1 instead.

Example 1:

Input: [[2,1,1],[1,1,0],[0,1,1]]
Output: 4
Example 2:

Input: [[2,1,1],[0,1,1],[1,0,1]]
Output: -1
Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
Example 3:

Input: [[0,2]]
Output: 0
Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.

**可能解法**

- BFS

**CODINNG**

*BFS*
```
class Solution {
    let dx = [0,1,0,-1]
    let dy = [1,0,-1,0]
    
    struct Pos {
        var row = 0
        var col = 0
        var minute = 0
    }
    func orangesRotting(_ grid: [[Int]]) -> Int {
        if grid.count == 0 {
            return 0
        }
        var grid = grid
        var queue = [Pos]()
        var minute = 0
        let maxRow = grid.count
        let maxCol = grid[0].count
        for row in 0..<maxRow {
            for col in 0..<maxCol {
                let num = grid[row][col]
                if num == 2 {
                    queue.append(Pos(row: row, col: col, minute: minute))
                }
            }
        }
    
       
        while !queue.isEmpty {
            let pos = queue.removeFirst()
            minute = pos.minute
            let row = pos.row
            let col = pos.col
            for i in 0...3 {
                let newRow = row + dx[i]
                let newCol = col + dy[i]
                if (newRow >= 0 && newRow < maxRow) &&
                    (newCol >= 0 && newCol < maxCol ) {
                    let newNum = grid[newRow][newCol]
                    if newNum == 1 {
                        grid[newRow][newCol] = 2
                        queue.append(Pos.init(row: newRow, col: newCol, minute: minute + 1))
                    }
                }
            }
        }
        print(grid)
        if countOfOne(grid) {
            return -1
        }
        return minute
    }
    
    func countOfOne(_ grid:[[Int]]) -> Bool {
        var countOfOne = 0

        for row in grid {
            for num in row {
                if num == 1 {
                    countOfOne += 1
                }
            }
        }
        return countOfOne > 0
    }
}
```
