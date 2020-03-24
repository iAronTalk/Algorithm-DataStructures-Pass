import UIKit

/*
 输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

 示例1：
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 限制：
 0 <= 链表长度 <= 1000
 */
//这道题目看了下迭代的答案，虽然理解递归排序的最后一步，但是设计链表还是有点迷。
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
//这种非递归的办法对于内存的消耗肯定是要比递归的高的。
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        var l1 = l1
        var l2 = l2
        var dummyNode = ListNode.init(-1)
        var pre: ListNode? = dummyNode
        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                pre?.next = l1
                l1 = l1!.next
            } else {
                pre?.next = l2
                l2 = l2?.next
            }
            pre = pre?.next
        }
        if l1 == nil {
            pre?.next = l2
        }
        if l2 == nil {
            pre?.next = l1
        }
        return dummyNode.next
    }
}

//递归写法
class Solution {
   func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let safeL1 = l1 else { return l2 }
        guard let safeL2 = l2 else { return l1 }
        
        if safeL1.val < safeL2.val {
            safeL1.next = mergeTwoLists(safeL1.next, safeL2)
            return safeL1
        } else {
            safeL2.next = mergeTwoLists(safeL2.next, safeL1)
            return safeL2
        }
    }
}
