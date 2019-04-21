# 125. Valid Palindrome - Easy

**验证回文串**

给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
说明：本题中，我们将空字符串定义为有效的回文串。

示例 1:
```
输入: "A man, a plan, a canal: Panama"
输出: true
```
**可能解法**
- 双指针，两个指针从前后开始遍历，一次比较。

- 两个数组，一个从前到后遍历所得，一个从后向前遍历所得，然后比较两个数组。

**CODINNG**

```
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var p = [Character]()
        var n = [Character]()

        for i in s.lowercased() {
            if i >= "0" && i <= "9" || i >= "a" && i <= "z" {
                p.append(i)
            }
        }

        for j in s.lowercased().reversed() {
            if j >= "0" && j <= "9" || j >= "a" && j <= "z" {
                n.append(j)
            }
        }

        if p == n {
            return true
        } else {
            return false
        }
    }
}
```
