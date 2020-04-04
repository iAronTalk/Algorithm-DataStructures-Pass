# 5. Longest Palindromic Substring - Medium
** 最长回文子串**
给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

```示例 1：

输入: "babad"
输出: "bab"
注意: "aba" 也是一个有效答案。
示例 2：

输入: "cbbd"
输出: "bb"
```

**可能解法**

- 暴力解法。
- DP

**CODINNG**

```
class Solution {
    func longestPalindrome(_ s: String) -> String {
        var sArray = Array(s)
        var n = sArray.count
        var dp = [[Bool]].init(repeating: [Bool].init(repeating: false, count: n), count: n)
        var startAt = 0, maxLenth = 0
        for i in (0..<s.count).reversed() {
            for j in i..<s.count {
                dp[i][j] = sArray[i] == sArray[j] && (j - i < 3 || dp[i + 1][j - 1])
                if dp[i][j] && (j - i + 1 > maxLenth) {
                    /*这里有个优化，使用startAt和maxLength保存最长的回文位置，而不是直接保存回文,
                     否则消耗裁剪字符串消耗更长的时间，无法通过leetcode测试用例最长时间的限制。
                     */
                    startAt = i
                    maxLenth = max(maxLenth, j - i + 1)
                }
            }
        }
        return String(sArray[startAt..<(startAt + maxLenth)])
    }
}
```
