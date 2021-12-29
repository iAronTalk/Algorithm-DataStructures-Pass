# 739.  Daily Temperatures - Medium
**每日温度**

根据每日 气温 列表 temperatures ，请计算在每一天需要等几天才会有更高的温度。如果气温在这之后都不会升高，请在该位置用 0 来代替。

示例 1:

输入: temperatures = [73,74,75,71,69,72,76,73]
输出: [1,1,4,2,1,1,0,0]

**CODINNG**
// 单调栈 存储的是下标
```
class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [Int]()
        var res = Array.init(repeating: 0, count: temperatures.count) // 切记一定要初始化
        for (i, temperature) in temperatures.enumerated() {
            while !stack.isEmpty && temperatures[stack.last!] < temperature {
                let idx = stack.removeLast()
                res[idx] = i - idx
            }
            stack.append(i)
        }
        return res
    }
}
```
