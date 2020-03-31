# 179-largest-number - Medium
**最大数**

给定一组非负整数，重新排列它们的顺序使之组成一个最大的整数。
```
示例 1:

输入: [10,2]
输出: 210
示例 2:

输入: [3,30,34,5,9]
输出: 9534330
说明: 输出结果可能非常大，所以你需要返回一个字符串而不是整数。
```
**所有可能解法**
- 拼接 - 重排
**CODINNG**

```
class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        if nums.count == 0 {
            return "0"
        }
        let sorted = nums.map{"\($0)"}.sorted { (left, right) -> Bool in
            return left + right > right + left
        }
        let res = sorted.joined()
        if res.prefix(1) == "0" {
            return "0"
        } else {
            return res
        }
    }
}

```
