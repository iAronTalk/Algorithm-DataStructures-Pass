# 53. Maximum Subarray - Easy
**最大子序和**
给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

```
示例:

输入: [-2,1,-3,4,-1,2,1,-5,4],
输出: 6
解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
```

**可能解法**

- 暴力解法。
- DP

**CODINNG**

```
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var dp = Array<Int>.init(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        var res = dp[0]
        for i in 1..<nums.count {
            if dp[i - 1] > 0{
                dp[i] = dp[i - 1] + nums[i]
            } else {
                dp[i] = nums[i]
            }
            res = max(res, dp[i])
        }

        return res
    }
}

```
