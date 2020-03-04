# 86. Partition List - Medium

**分隔链表**

给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。

你应当保留两个分区中每个节点的初始相对位置。

示例:

输入: head = 1->4->3->2->5->2, x = 3
输出: 1->2->2->4->3->5

**所有可能解法**
- 两个链表拼接，哑巴指针。

**CODINNG**

```
class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        let before_head = ListNode(0)
        var before = before_head
        let after_head = ListNode(0)
        var after = after_head
        var head = head
        while head != nil {
            if head!.val < x {
                before.next = head!
                before = head!
            } else {
                after.next = head
                after = head!
            }
            head = head!.next
        }
        after.next = nil;
        before.next = after_head.next
        return before_head.next
    }
}
```
