# 72.Edit Distance - hard
**编辑距离**
给定两个单词 word1 和 word2，计算出将 word1 转换成 word2 所使用的最少操作数 。

```
你可以对一个单词进行如下三种操作：

插入一个字符
删除一个字符
替换一个字符
示例 1:

输入: word1 = "horse", word2 = "ros"
输出: 3
解释:
horse -> rorse (将 'h' 替换为 'r')
rorse -> rose (删除 'r')
rose -> ros (删除 'e')
示例 2:

输入: word1 = "intention", word2 = "execution"
输出: 5
解释:
intention -> inention (删除 't')
inention -> enention (将 'i' 替换为 'e')
enention -> exention (将 'n' 替换为 'x')
exention -> exection (将 'n' 替换为 'c')
exection -> execution (插入 'u')
```

**可能解法**

- 暴力递归
- DP

**CODINNG**

```
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let m = word1.count
        let n = word2.count
        if m == 0 {
            return n
        }
        if n == 0 {
            return m
        }
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: n + 1), count: m + 1)
        //i表示单词1对比到哪一位，j表示单词2对比到哪一位，存储的数值代码对比到i和j的位置，走了多少步骤。
        for i in 0...m {
            dp[i][0] = i
        }
        for j in 0...n {
            dp[0][j] = j
        }

        for i in 1...m {
            for j in 1...n {
                let startI = word1.startIndex
                let startJ = word2.startIndex
                let indexI = word1.index(startI, offsetBy: i - 1)
                let indexj = word2.index(startJ, offsetBy: j - 1)
                dp[i][j] = min(dp[i-1][j-1] + (word1[indexI] == word2[indexj] ? 0 : 1), dp[i-1][j] + 1, dp[i][j-1] + 1)
            }
        }
        return dp[m][n]
    }
}
```
