# 83. Remove Duplicates from Sorted List - Easy
**删除排序链表中的重复元素**

给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。

示例 1:
```
输入: 1->1->2
输出: 1->2
```
**注意事项**

使用一个dummyNode，处理头结点赋值问题。

**CODINNG**

```
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let safeHead = head else { return nil }

        let dummy: ListNode = ListNode.init(Int.min)
        dummy.next = safeHead
        var cur: ListNode? = safeHead
        var pre: ListNode? = dummy
        while cur != nil {
            if cur?.val == pre?.val {
                pre?.next = cur?.next
            } else {
                pre = cur
            }
             cur = cur?.next
        }

        return dummy.next
    }
}
```
