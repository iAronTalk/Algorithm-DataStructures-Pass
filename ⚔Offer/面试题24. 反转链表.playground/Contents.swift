import UIKit

/*
 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。

  

 示例 1：

 输入：head = [1,3,2]
 输出：[2,3,1]
 */

//leetcode链接：https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/

 public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 
class Solution {
     func reversePrint(_ head: ListNode?) -> [Int] {
        guard head != nil else {
            return []
        }

        var stack = [Int]()
        var cur = head
        while cur != nil {
            stack.append(cur!.val)
            cur = cur?.next
        }
        var res = [Int]()
        while !stack.isEmpty {
            res.append(stack.removeLast())
        }
        return res
    }
}
