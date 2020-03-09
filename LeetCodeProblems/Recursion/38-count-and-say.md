# 38. Count And Say - Easy
*「外观数列」是一个整数序列，从数字 1 开始，序列中的每一项都是对前一项的描述。前五项如下：
```
1.     1
2.     11
3.     21
4.     1211
5.     111221
1 被读作  "one 1"  ("一个一") , 即 11。
11 被读作 "two 1s" ("两个一"）, 即 21。
21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。

给定一个正整数 n（1 ≤ n ≤ 30），输出外观数列的第 n 项。

注意：整数序列中的每一项将表示为一个字符串。

示例 1:

输入: 1
输出: "1"
解释：这是一个基本样例。
示例 2:

输入: 4
输出: "1211"
解释：当 n = 3 时，序列是 "21"，其中我们有 "2" 和 "1" 两组，"2" 可以读作 "12"，也就是出现频次 = 1 而 值 = 2；类似 "1" 可以读作 "11"。所以答案是 "12" 和 "11" 组合在一起，也就是 "1211"。
```

**可能解法**

- recursion，本人采用的办法。
- 迭代
**CODINNG**

```
//swift 涉及到字符和字符串的处理真的是裹脚布，很恶心。
class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 0 {
            return ""
        }
        return helper(n - 1, "1")
    }
    
    func helper(_ n: Int, _ cur: String) -> String {
        if n == 0 {
            return cur
        }
        var handled: String = ""
        var count = 1
        for i in 0..<cur.count {
            let curIndex = cur.index(cur.startIndex, offsetBy: i)
            let char = cur[curIndex]
           if i == 0 {
                count = 1
           } else if char == cur[cur.index(before: curIndex)] {
                count += 1
           } else if char != cur[cur.index(before: curIndex)] {
                handled += "\(count)\(cur[cur.index(before: curIndex)])"
                count = 1
            }
            //最后这里要做兜底，避免漏了最后一个位的描述。
            if i == cur.count - 1 {
                handled += "\(count)\(char)"
            }
        }
        
        print(handled)
        return helper(n - 1, handled)
    }
}
```
