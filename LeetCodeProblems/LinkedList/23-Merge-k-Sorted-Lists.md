# 23. Merge k Sorted Lists - Hard
**合并K个排序链表**

合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。

示例:

```输入:
[
  1->4->5,
  1->3->4,
  2->6
]
输出: 1->1->2->3->4->4->5->6
```

**可能的思路**
- 两两合并（分治大法），然后递归，Coding中使用的方案。
- 使用了最小堆这种数据结构，我们首先把k个链表的首元素都加入最小堆中，它们会自动排好序。然后我们每次取出最小的那个元素加入我们最终结果的链表中，然后把取出元素的下一个元素再加入堆中，下次仍从堆中取出最小的元素做相同的操作，以此类推，直到堆中没有元素了，此时k个链表也合并为了一个链表，返回首节点即可。

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

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        if lists.count == 1 {
            return lists.first!
        }

        var res = [ListNode]()
        for i in 0...(lists.count - 1) where i & 1 == 0{
            var listNode: ListNode? = nil
            if i + 1 <= lists.count - 1 {
                listNode = mergeTwoLists(lists[i], lists[i + 1])
            } else {
                listNode = mergeTwoLists(lists[i], nil)
            }

            if let safeListNode = listNode {
                res.append(safeListNode)
            }
        }

        return mergeKLists(res)
    }
}
```
