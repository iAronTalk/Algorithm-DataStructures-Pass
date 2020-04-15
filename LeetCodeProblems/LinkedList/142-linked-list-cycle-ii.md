# 142. linked-list-cycle-ii - Medium

**环形链表 II**

给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。

说明：不允许修改给定的链表。

``` 
示例 1：

输入：head = [3,2,0,-4], pos = 1
输出：tail connects to node index 1
解释：链表中有一个环，其尾部连接到第二个节点。

示例 2：
输入：head = [1,2], pos = 0
输出：tail connects to node index 0
解释：链表中有一个环，其尾部连接到第一个节点。

示例 3：
输入：head = [1], pos = -1
输出：no cycle
解释：链表中没有环。
```

进阶：
你是否可以不用额外空间解决此题？

**CODINNG**

```
class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        let inter = findInterection(head)
        if inter == nil {
            return nil
        }
        //然后画画图可以发现规律，可以找到环所在的位置。有兴趣的可以去Leetcode官网查看数学证明。
        var p1: ListNode? = head
        var p2: ListNode? = inter
        while p1 !== p2 {
            p1 = p1?.next
            p2 = p2?.next
        }
        return p1
    }
    //先通过快慢指针找到第一次快慢指针相交的点。
    func findInterection(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var p1: ListNode? = head
        var p2: ListNode? = head
        while p1 != nil && p2 != nil {
            p1 = p1?.next
            p2 = p2?.next?.next
            if p1 === p2 {
                return p1
            }
        }
        return nil
    }
}
```
