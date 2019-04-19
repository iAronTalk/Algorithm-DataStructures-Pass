# 19. Remove Nth Node From End of List - Medium
**删除链表的倒数第N个节点**

给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

说明：

给定的 n 保证是有效的。

**所有可能解法**

- 快慢指针

**注意事项**

使用一个dummyNode，这样可以处理在只有一个节点，无法把头结点置为nil。

**CODINNG**

```
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let safeHead = head else {
            return nil
        }

        let dummy = ListNode.init(0)
        //题目判定n有效，暂不做处理
        var localN = n
        var fast: ListNode? = dummy
        var slow: ListNode? = dummy
        slow?.next = safeHead
        while fast?.next != nil {
            fast = fast!.next
            if localN > 0  {
                localN = localN - 1
            } else {
                slow = slow!.next
            }
        }

        slow?.next = slow?.next?.next
        return dummy.next
    }
}
```
