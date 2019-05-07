# 131. Palindrome Partitioning - Medium
**分割回文串**

*解释下回文串*
字符串中心对称，如"a" "aa" "aba" 都是回文串。

给定一个字符串 s，将 s 分割成一些子串，使每个子串都是回文串。
返回 s 所有可能的分割方案。

示例:

```
输入: "aab"
输出:
[
  ["aa","b"],
  ["a","a","b"]
]
```

**可能解法**

- 回溯，DFS

**CODINNG**

```
class Solution {
    var res = [[String]]()
    func isPalindroom(_ s: String, _ left: Int, _ right: Int) -> Bool {
        var localLeft = left
        var localRight = right

        var leftIndex = s.index(s.startIndex, offsetBy: localLeft)
        var rightIndex = s.index(s.startIndex, offsetBy: localRight)

        while localLeft < localRight && s[leftIndex] == s[rightIndex] {
            localLeft += 1
            localRight -= 1
            leftIndex = s.index(s.startIndex, offsetBy: localLeft)
            rightIndex = s.index(s.startIndex, offsetBy: localRight)
        }
        return localLeft >= localRight
    }

    func _dfs(_ s: String, _ remain: inout [String], _ left: Int) -> Void {
        if left == s.count {
            res.append(remain)
            return
        }

        for right in left..<s.count {
            if isPalindroom(s, left, right) {
                let leftIndex = s.index(s.startIndex, offsetBy: left)
                let rightIndex = s.index(s.startIndex, offsetBy: right)
                remain.append(String(s[leftIndex...rightIndex]))
                _dfs(s, &remain, right + 1)
                remain.removeLast()
            }
        }
    }
    func partition(_ s: String) -> [[String]] {
        if s.count == 0 {
            return res
        }
        var remain = [String]()
        _dfs(s, &remain, 0)
        return res
    }
}

```
