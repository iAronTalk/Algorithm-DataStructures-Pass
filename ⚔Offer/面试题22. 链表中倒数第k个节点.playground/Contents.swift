import UIKit
/*
 输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。例如，一个链表有6个节点，从头节点开始，它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个节点是值为4的节点。
 示例：

 给定一个链表: 1->2->3->4->5, 和 k = 2.

 返回链表 4->5.
 */
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
      self.val = val
      self.next = nil
  }
}

class Solution {
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }
        var fast = head
        var slow = head
        var index = 0
        while fast != nil {
            if index < k - 1 {
                fast = fast?.next
                index += 1
                continue
            } else if index == k - 1 {
                fast = fast?.next
                slow = head
                index += 1
                continue
            }
            fast = fast?.next
            slow = slow?.next
            index += 1
        }
        return slow
    }
}
