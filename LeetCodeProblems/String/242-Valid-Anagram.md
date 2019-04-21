# 242. Valid Anagram - Easy

**有效的字母异位词**

给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的一个字母异位词。

示例 1:
```
输入: s = "anagram", t = "nagaram"
输出: true
```

**CODINNG**

```
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var sMap = [Character:Int]()
        var tMap = [Character:Int]()

        for c in s {
            if let cNum = sMap[c] {
                sMap[c] = cNum + 1
            } else {
                sMap[c] = 1
            }
        }

        for c in t {
            if let cNum = tMap[c] {
                tMap[c] = cNum + 1
            } else {
                tMap[c] = 1
            }
        }

        return sMap == tMap
    }
}
```
