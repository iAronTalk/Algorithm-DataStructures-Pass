# 21. Merge Two Sorted Lists - Easy
**合并两个有序链表**

将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

示例：
```
输入：1->2->4, 1->3->4
输出：1->1->2->3->4->4
```

**可能的思路**
- 递归，Coding中使用的方案
- 归并排序的类似思路
**CODINNG**

```
class Solution {
  func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
      guard let safeL1 = l1 else { return l2 }
      guard let safeL2 = l2 else { return l1 }

      if safeL1.val < safeL2.val {
          safeL1.next = mergeTwoLists(safeL1.next, safeL2)
          return safeL1
      } else {
          safeL2.next = mergeTwoLists(safeL2.next, safeL1)
          return safeL2
      }
  }
}
```
