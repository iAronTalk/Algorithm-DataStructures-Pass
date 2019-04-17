# 2. Add Two Numbers - Medium
**2. 两数相加**

给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

示例：

```
输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
输出：7 -> 0 -> 8
原因：342 + 465 = 807
```
**所有可能解法**

- 快慢指针

使用一个dummyNode，处理头结点赋值问题。

**CODINNG**

*递归解法*
```
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        }

        var p: ListNode? = l1
        var q: ListNode? = l2

        var carry = 0
        let dummy: ListNode = ListNode.init(0)
        var cur: ListNode? = dummy

        while p != nil || q != nil {
            var x = 0
            var y = 0
            if p != nil {
                x = p!.val
            }
            if q != nil {
                y = q!.val
            }

            let sum = x + y + carry
            cur?.next = ListNode.init(sum % 10)
            carry = sum / 10
            cur = cur?.next
            p = p?.next
            q = q?.next
        }

        //最后记得判断carry的值，有进位，说明后面还应该有一个节点。
        if carry > 0 {
            cur?.next = ListNode.init(carry)
        }

        return dummy.next
    }
}
```
