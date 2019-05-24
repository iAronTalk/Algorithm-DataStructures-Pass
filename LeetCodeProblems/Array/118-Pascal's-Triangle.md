# 118. Pascal's Triangle - Easy
**杨辉三角**

给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。

在杨辉三角中，每个数是它左上方和右上方的数的和。

示例:

```
输入: 5
输出:
[
     [1],
    [1,1],
   [1,2,1],
  [1,3,3,1],
 [1,4,6,4,1]
]
```
**可能解法**

- 常规的计算每一层的数值

**CODINNG**

```
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows <= 0 {
            return []
        }
        var res = [[Int]]()
        res.append([1])
        for i in 1..<numRows { //层
            var temp = [Int]()
            let last = res[i - 1] //上一层
            for j in 0...i {
                var k = j
                var sum = 0
                if j == 0 { //当前层的首个元素
                    sum = last.first!
                } else if j == i {  //当前层的最后一个元素
                    sum = last.last!
                } else {  //当前层的其他元素，这个地方写的有点丑了。
                    sum = last[j-1] + last[j]
                }
                temp.append(sum)
            }
            res.append(temp)
        }
        return res
    }
}
```
