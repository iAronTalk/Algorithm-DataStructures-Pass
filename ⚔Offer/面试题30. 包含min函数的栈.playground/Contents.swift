import UIKit

/*
 定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的 min 函数在该栈中，调用 min、push 及 pop 的时间复杂度都是 O(1)。
 示例:

 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.min();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.min();   --> 返回 -2.

 提示：

 各函数的调用总次数不超过 20000 次

 注意：本题与主站 155 题相同：https://leetcode-cn.com/problems/min-stack/
 */

class MinStack {
    var internalStack = [Int]()
    var minStack = [Int]()
    
    /** initialize your data structure here. */
    init() {

    }
    
    func push(_ x: Int) {
        if minStack.isEmpty  || x <= self.min() { //这个地方要小心，minStack为空时，已经x <= self.min,不是<，你品，你细品。
            minStack.append(x)
        }
        internalStack.append(x)
    }
    
    func pop() {
        if !minStack.isEmpty && self.top() == self.min() {
            minStack.removeLast()
        }
        if !internalStack.isEmpty {
            internalStack.removeLast()
        }
    }
    
    func top() -> Int {
        if !internalStack.isEmpty {
            return internalStack.last!
        }
        return 0
    }
    
    func min() -> Int {
        if !minStack.isEmpty {
            return minStack.last!
        }
        return 0
    }
}
