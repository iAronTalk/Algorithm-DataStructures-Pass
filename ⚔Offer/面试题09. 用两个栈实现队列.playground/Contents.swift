import UIKit
/*
 用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )

 示例 1：

 输入：
 ["CQueue","appendTail","deleteHead","deleteHead"]
 [[],[3],[],[]]
 输出：[null,null,3,-1]
 示例 2：

 输入：
 ["CQueue","deleteHead","appendTail","appendTail","deleteHead","deleteHead"]
 [[],[],[5],[2],[],[]]
 输出：[null,-1,null,null,5,2]
 提示：

 1 <= values <= 10000
 最多会对 appendTail、deleteHead 进行 10000 次调用
 */
class CQueue {
    var stackIn = [Int]()
    var stackOut = [Int]()
    init() {
    }
    
    func appendTail(_ value: Int) {
        //无需理会是否为空
        stackIn.append(value)
    }
    
    func deleteHead() -> Int {
        //为空，则把in中的元素全部挪过来
        if stackOut.isEmpty {
            while !stackIn.isEmpty {
                let temp = stackIn.removeLast()
                stackOut.append(temp)
            }
            if !stackOut.isEmpty {
                return stackOut.removeLast()
            } else {
                return -1
            }
        } else { //不为空，就优先挪出out中的元素
             return stackOut.removeLast()
        }
    }
}
