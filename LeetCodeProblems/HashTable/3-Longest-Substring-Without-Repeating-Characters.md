# 3. Longest Substring Without Repeating Characters - Medium
**无重复字符的最长子串**

给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

示例 1:
```
输入: "abcabcbb"
输出: 3
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
```

**可能的解法**
- 暴力解法，两层for循环。
- 哈希表，滑动窗口。

**CODINNG**

```
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        var map = [Character: Int]() //key是字符，value为字符出现的字符串中的位置
        var i = 0
        var j = 0
        var res = 0

        for item in s {
            if map.keys.contains(item) {
                i = max(map[item]!, i)
            }
            res = max(res, (j - i + 1))
            map[item] = j + 1
            j += 1
        }

        return res
    }
}
```
