# 203. Remove Linked List Elements - Easy
**移除链表元素**

删除链表中等于给定值 val 的所有节点。

示例:
```
输入: 1->2->6->3->4->5->6, val = 6
输出: 1->2->3->4->5
```

**注意事项**

使用一个dummyNode.

**CODINNG**

```
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let safeHead = head else {
            return nil
        }

        let dummy = ListNode.init(0)
        dummy.next = safeHead
        var cur: ListNode? = safeHead
        var pre: ListNode? = dummy
        while cur != nil {
            if val == cur!.val {
                pre?.next = cur?.next
            } else {
                //注意，只有在当前节点和待删除的值不相等的情况，pre节点才向下移动。
                pre = cur
            }
            cur = cur?.next
        }
        return dummy.next
    }
}
```
