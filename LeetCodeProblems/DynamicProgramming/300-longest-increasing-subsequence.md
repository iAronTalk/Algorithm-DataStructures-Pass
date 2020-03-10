# 300.Longest Increasing Subsequence - Medium
**最长上升子序列**
给定一个无序的整数数组，找到其中最长上升子序列的长度。
```
示例:

输入: [10,9,2,5,3,7,101,18]
输出: 4
解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
说明:

可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
你算法的时间复杂度应该为 O(n2) 。
进阶: 你能将算法的时间复杂度降低到 O(n log n) 吗?
```
**可能解法**

- 暴力递归
- DP

**CODINNG**

```
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var res = nums[0]
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: 2), count: 2) //只用2x2的数组即可。
        dp[0][0] = nums[0]
        dp[0][1] = nums[0]
        for i in 1..<nums.count {
            let x = i % 2 //获取最大值的位置。
            let y = (i - 1) % 2 //获取最小值的位置。
            dp[x][0] = max(dp[y][0] * nums[i], dp[y][1] * nums[i], nums[i])
            dp[x][1] = min(dp[y][0] * nums[i], dp[y][1] * nums[i], nums[i])
            res = max(res, dp[x][0])
        }
        return res
    }
}
```
