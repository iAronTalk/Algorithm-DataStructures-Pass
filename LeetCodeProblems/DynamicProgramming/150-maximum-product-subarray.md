# 150.Maximum-Product-Subarray - Medium
**买卖股票的最佳时机 II**
给定一个整数数组 nums ，找出一个序列中乘积最大的连续子序列（该序列至少包含一个数）。
```
示例 1:

输入: [2,3,-2,4]
输出: 6
解释: 子数组 [2,3] 有最大乘积 6。
示例 2:

输入: [-2,0,-1]
输出: 0
解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。
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
