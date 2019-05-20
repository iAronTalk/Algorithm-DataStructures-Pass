# 96. Unique Binary Search Trees - Medium
**不同的二叉搜索树**

给定一个整数 n，求以 1 ... n 为节点组成的二叉搜索树有多少种？

示例:

```
输入: 3
输出: 5
解释:
给定 n = 3, 一共有 5 种不同结构的二叉搜索树:

   1         3     3      2      1
    \       /     /      / \      \
     3     2     1      1   3      2
    /     /       \                 \
   2     1         2                 3
```

**所有可能解法**

- DP

**CODINNG**

*DP解法*
```
class Solution {
    func numTrees(_ n: Int) -> Int {
        var dp = Array<Int>.init(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1

        if n < 2 {
            return dp[n]
        }
        for i in 2...n  {
            for j in 1...i {
                dp[i] += dp[i - j] * dp[j - 1]
            }
        }
        return dp[n]
    }
}
```
