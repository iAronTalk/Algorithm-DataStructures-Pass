# 61. Rotate List - Medium
**旋转链表**

给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。

示例：

```
输入: 1->2->3->4->5->NULL, k = 2
输出: 4->5->1->2->3->NULL
解释:
向右旋转 1 步: 5->1->2->3->4->NULL
向右旋转 2 步: 4->5->1->2->3->NULL
```
**注意事项**
处理重复的操作，k为链表长度的整数倍时，取余进行操作。
**CODINNG**

*递归解法*
```
class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let safeHead = head else { return nil }

        if k == 0 {
            return safeHead
        }

        var pre: ListNode? = nil
        var cur: ListNode? = safeHead

        var listLength = 1
        while cur?.next != nil {
            pre = cur!
            cur = cur?.next
            listLength = listLength + 1
        }

        //处理重复的操作，k为链表长度的整数倍时，取余进行操作。
        let localK = k % listLength
        if localK == 0 {
            return safeHead
        } else {
            pre?.next = nil
            cur?.next = head
            return rotateRight(cur, localK - 1)
        }
    }
}
```
