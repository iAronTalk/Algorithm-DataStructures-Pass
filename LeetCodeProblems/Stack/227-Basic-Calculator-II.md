# 227. Basic Calculator II - Medium
**基本计算器 II**

实现一个基本的计算器来计算一个简单的字符串表达式的值。

字符串表达式仅包含非负整数，+， - ，* ，/ 四种运算符和空格，整数除法仅保留整数部分。

示例 1:

```
输入: "3+2*2"
输出: 7
示例 2:

输入: " 3/2 "
输出: 1
示例 3:

输入: " 3+5 / 2 "
输出: 5
说明：

你可以假设所给定的表达式都是有效的。
请不要使用内置的库函数 eval。
```
备注：这道题应该是Grab面试的时候考察过。
**CODINNG**

```
class Solution {
    func isDigit(_ char: Character) -> Bool {
        return (Character("0")...Character("9")).contains(char) //这一步操作记住。
    }

    func calculate(_ s: String) -> Int {
        var res = 0
        var num = 0
        var sign = "+"

        var stack = [Int]()
        let sArray = Array(s)
        for i in 0..<sArray.count {
            let cur = sArray[i]
            if isDigit(cur) {
                num = num * 10 + Int(String(cur))! - Int("0")!
            }

            if (!isDigit(cur) && cur != " ") || i == sArray.count - 1 {
                if sign == "+" {
                    stack.append(num)
                } else if sign == "-" {
                    stack.append(-num)
                } else if sign == "*" {
                    stack.append(stack.removeLast() * num)
                } else if sign == "/" {
                    stack.append(stack.removeLast() / num)
                }

                num = 0
                sign = String(cur) //记录上一个符号。
            }
        }

        while !stack.isEmpty {
            res = res + stack.removeLast()
        }

        return res
    }
}
```
