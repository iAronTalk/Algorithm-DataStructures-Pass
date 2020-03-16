import UIKit

/*
 请定义一个队列并实现函数 max_value 得到队列里的最大值，要求函数max_value、push_back 和 pop_front 的均摊时间复杂度都是O(1)。

 若队列为空，pop_front 和 max_value 需要返回 -1

 示例 1：

 输入:
 ["MaxQueue","push_back","push_back","max_value","pop_front","max_value"]
 [[],[1],[2],[],[],[]]
 输出: [null,null,null,2,1,2]
 示例 2：

 输入:
 ["MaxQueue","pop_front","max_value"]
 [[],[],[]]
 输出: [null,-1,-1]

 */

//解法：这是一道看似简单，实际不简单的题目，双端队列来更新max中的值，有新值进入后，把小于这个值的所有数全部抛出，然后无论如何把这个数放进去。保持队列的前端放置的最大。
//leetcode链接：https://leetcode-cn.com/problems/dui-lie-de-zui-da-zhi-lcof/
class MaxQueue {
    var max = [Int]()
    var internalQueue = [Int]()
    
    init() {

    }
    
    func max_value() -> Int {
        if internalQueue.count == 0 {
            return -1
        }
        return max.first!
    }
    
    func push_back(_ value: Int) {
        while max.count > 0 && value > max.last! {
            max.removeLast()
        }
        max.append(value)
        internalQueue.append(value)
    }
    
    func pop_front() -> Int {
        if internalQueue.count == 0 {
            return -1
        }
        let front = internalQueue.removeFirst()
        if front == max.first {
            max.removeFirst()
        }
        return front
    }
}
