# 55. Jump Game - Medium
**跳跃游戏**
给定一个非负整数数组，你最初位于数组的第一个位置。

数组中的每个元素代表你在该位置可以跳跃的最大长度。

判断你是否能够到达最后一个位置。

```
示例 1:

输入: [2,3,1,1,4]
输出: true
解释: 从位置 0 到 1 跳 1 步, 然后跳 3 步到达最后一个位置。
示例 2:

输入: [3,2,1,0,4]
输出: false
解释: 无论怎样，你总会到达索引为 3 的位置。但该位置的最大跳跃长度是 0 ， 所以你永远不可能到达最后一个位置。
```

**可能解法**

- 限制当前最大跳跃数，问是否能到达最后一个index。需要反向往后推演。
- DP
- 贪心
**CODINNG**

*方法一*
```
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 0 {
            return true
        }

        var index = nums.count - 1
        for i in (0..<nums.count - 1).reversed() {
            if i + nums[i] >= index { index = i }
        }

        return index <= 0
    }
}
```

*方法二，贪心*
其实这题最好的解法不是DP，而是贪婪算法Greedy Algorithm，因为我们并不是很关心每一个位置上的剩余步数，我们只希望知道能否到达末尾，也就是说我们只对最远能到达的位置感兴趣。
所以我们维护一个变量reach，表示最远能到达的位置，初始化为0。遍历数组中每一个数字，如果当前坐标大于reach或者reach已经抵达最后一个位置则跳出循环，否则就更新reach的值为其和i + nums[i]中的较大值，其中i + nums[i]表示当前位置能到达的最大位置。
```
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 0 {
            return true
        }

        var reach = 0
        for i in 0...nums.count - 1 {
            if reach < i ||  reach >= nums.count - 1{
                break
            }
            reach = max(reach, i + nums[i])
        }
        return reach >= nums.count - 1

    }
}
```

*方法三，DP*
dp[i]，到达位置i，还有多少剩余的跳力。

```
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 0 {
            return true
        }

        let n = nums.count
        var dp = Array<Int>.init(repeating: 0, count: n)
        dp[0] = nums[0]
        for i in 1..<n {
            dp[i] = max(dp[i-1], nums[i-1]) - 1
            if dp[i] < 0 {
                return false
            }
        }

        return true
    }
}
```
