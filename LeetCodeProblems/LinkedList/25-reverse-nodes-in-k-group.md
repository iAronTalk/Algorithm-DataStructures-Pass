# 237. Reverse Nodes In-k-Group - Hard

** K 个一组翻转链表**

给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。

k 是一个正整数，它的值小于或等于链表的长度。

如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

```
示例：

给你这个链表：1->2->3->4->5

当 k = 2 时，应当返回: 2->1->4->3->5

当 k = 3 时，应当返回: 3->2->1->4->5
```
说明：

你的算法只能使用常数的额外空间。
你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。

**CODINNG**
参考经典答案解出来的。
/*
 例子：n0-n1-n2-n3-n4-n5-n6,k = 3
 */
class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }

        let dummy = ListNode.init(0)
        dummy.next = head //傻瓜节点

        var pre: ListNode? = dummy //pre位于n0前一个位置，翻转后n0是第一段的最后一个节点，pre指向它
        var end: ListNode? = dummy//分别停顿在n2,n5
        while end?.next != nil {
            for _ in 0..<k {
                end = end?.next
            }
            if end == nil { //遍历到最后，直接停止，不进行翻转
                break
            }
            let start = pre?.next //开始翻转的节点
            let endNext = end?.next //尾结点的下一个，n3,n6
            end?.next = nil //与原来的next断开，因为endNext已经保留了下个节点的位置。
            pre?.next = reverseNode(start) //从头翻转，此时end已经断开
            start?.next = endNext //翻转后start节点连接下一步的头结点，即endNext
            pre = start //此时start为当前段的最后一个节点，pre应该指向它
            end = pre //end也指向下一段第一个节点的前一个节点，就像最初指向dummy节点一样。
        }
        return dummy.next
    }
    //翻转不多说了
    func reverseNode(_ head: ListNode?) -> ListNode? {
        var pre: ListNode?
        var cur = head
        while cur != nil {
            let curNext = cur!.next
            cur!.next = pre
            pre = cur
            cur = curNext
        }
        return pre
    }
}
```
