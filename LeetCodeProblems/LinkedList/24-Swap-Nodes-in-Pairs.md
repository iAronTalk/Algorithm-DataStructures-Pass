# 24. Swap Nodes in Pairs - Medium
**两两交换链表中的节点**

给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

示例:
```
给定 1->2->3->4, 你应该返回 2->1->4->3.
```
**注意事项**

可以使用一个dummyNode，处理头结点赋值问题。也可以用递归处理问题。

**可能解法**
- 递推，如方法一
- 直接替换

**CODINNG**

//dummy(pre)-a-b-c-d..为例
*方法一*
```
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let safeHead = head else { return nil }

        var dummy = ListNode.init(Int.min)
        dummy.next = safeHead
        var pre: ListNode? = dummy
        var cur: ListNode? = safeHead
        while cur?.next != nil {
            //保存c
            let temp: ListNode? = cur!.next?.next

            //dummy.next = b
            pre?.next = cur!.next

            //b.next = a
            cur!.next?.next = cur

            //a.next = c
            cur!.next = temp

            //pre = a(此时a位于b后面)，cur= c。
            pre = cur
            cur = temp
        }

        return dummy.next
    }
}
```

*方法二*
```
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let safeHead = head, safeHead.next != nil else {
            return head
        }

        var secondNode = safeHead.next
        var thirdNode = secondNode?.next

        secondNode?.next = safeHead
        safeHead.next = swapPairs(thirdNode)

        return secondNode
    }
}
```
