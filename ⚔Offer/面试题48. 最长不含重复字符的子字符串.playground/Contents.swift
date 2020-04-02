import UIKit

/*
 请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子字符串的长度。
 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
  
 提示：

 s.length <= 40000
 注意：本题与主站 3 题相同：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/
 */
//动态规划
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        let sArray = Array(s)
        var dp = [Int].init(repeating: 0, count: sArray.count) //记录当前位置的不重复的长度是多少。
        dp[0] = 1
        var maxLen = 1
        var map = [Character: Int]() //key为字符，value为其出现的最近一次下标。
        map[sArray.first!] = 0
        for index in 1..<sArray.count {
            let char = sArray[index]
            if !map.keys.contains(char) || (index - map[char]!) > dp[index - 1] {
                dp[index] = dp[index - 1] + 1
            } else {
                dp[index] = index - map[char]!
            }
            map[char] = index
            maxLen = max(maxLen, dp[index])
        }
        return maxLen
    }
}

//双指针滑动窗口
class Solution2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        let sArray: [Character] = Array(s)
        var low = 0
        var res = 0
        for high in 0..<sArray.count {
            if sArray[low...high].contains(sArray[high]) {
                while sArray[low...high].contains(sArray[high]) {
                    low += 1
                }
            } else {
                res = max(res, high - low + 1)
            }
        }
        return res
    }
}
