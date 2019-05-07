# 844. Backspace String Compare - Easy
**比较含退格的字符串**

给定 S 和 T 两个字符串，当它们分别被输入到空白的文本编辑器后，判断二者是否相等，并返回结果。 # 代表退格字符。

示例 1：

```
输入：S = "ab#c", T = "ad#c"
输出：true
解释：S 和 T 都会变成 “ac”。
示例 2：

输入：S = "ab##", T = "c#d#"
输出：true
解释：S 和 T 都会变成 “”。
示例 3：

输入：S = "a##c", T = "#a#c"
输出：true
解释：S 和 T 都会变成 “c”。
示例 4：

输入：S = "a#c", T = "b"
输出：false
解释：S 会变成 “c”，但 T 仍然是 “b”。
```

提示：

```
1 <= S.length <= 200
1 <= T.length <= 200
S 和 T 只含有小写字母以及字符 '#'。
```
**可能解法**

- 解法很多，本例使用栈进行存储。

**CODINNG**

```
class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var stackS = [Character]()
        var stackT = [Character]()
        for s in S {
            if s != "#" {
                stackS.append(s)
            } else if !stackS.isEmpty && s == "#" {
                stackS.removeLast()
            }
        }

        for t in T {
            if t != "#" {
                stackT.append(t)
            } else if !stackT.isEmpty && t == "#" {
                stackT.removeLast()
            }
        }
        return stackS == stackT
    }
}

```
