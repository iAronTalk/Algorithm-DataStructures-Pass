# 7. Reverse Integer - Easy

//参考答案了

**整数反转**
给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

注意:
假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。

**CODINNG**

```
class Solution {
    func reverse(_ x: Int) -> Int {
        let negative = x < 0
        var x = negative ? -x : x
        var result = 0

        while x > 0 {
            result = result * 10 + x % 10
            x = x / 10
        }

        if Int32.max < result || Int32.min > result {
            return 0
        }

        return negative ? -result : result
    }
}
```
