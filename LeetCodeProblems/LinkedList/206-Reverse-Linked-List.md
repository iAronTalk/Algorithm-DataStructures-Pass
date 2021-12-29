# 206. Reverse Linked List - Easy

**反转链表**

反转一个单链表。

示例:
```
输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL
```
**注意事项**

最后别忘记给cur.next 赋值为pre，因为只判断了cur.next为nil时候，翻转后的cur.next并没有赋值。

**CODINNG**

```
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let safeHead = head else { return nil }

        var cur: ListNode? = head
        var pre: ListNode? = nil

        while cur?.next != nil {
            let curNext = cur?.next
            cur?.next = pre
            pre = cur
            cur = curNext
        }
        cur?.next = pre
        return cur
    }
}

// 递归写法
class Solution {
     func reverseList(_ head: ListNode?) -> ListNode? {
        
        if head == nil || head?.next == nil {
            return head
        }
        let nextHead = reverseList(head!.next)
        head!.next!.next = head
        head!.next = nil
        return nextHead
    }
}
```
