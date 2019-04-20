# 83. Remove Duplicates from Sorted List II- Medium
**删除排序链表中的重复元素 II**

给定一个排序链表，删除所有含有重复数字的节点，只保留原始链表中 没有重复出现 的数字。

示例 1:
```
输入: 1->2->3->3->4->4->5
输出: 1->2->5
```

**注意事项**

- 使用一个dummyNode，处理头结点赋值问题。

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
            //if判断，借用外部循环也可以
//            if cur!.next != nil && cur?.val == cur?.next?.val {
//                cur = cur?.next
//                continue
//            }
            //or不适用if，内部从新使用个循环
            while cur?.next != nil &&  cur?.val == cur?.next?.val {
                cur = cur?.next
            } //

            // 如果当前元素和下一个元素不相同，避免误删除。
            if pre?.next === cur {
                pre = cur
            } else {
                pre?.next = cur?.next
            }
            cur = cur?.next
        }

        return dummy.next
    }
}
```
