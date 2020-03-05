# 143. Reorder Lis - Medium

**重排链表**

给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…

你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

示例 1:

给定链表 1->2->3->4, 重新排列为 1->4->2->3.
示例 2:

给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/reorder-list
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

**所有可能解法**
- 找到中间节点，拆分链表翻转后半部分，然后再拼接。

**CODINNG**

```
class Solution {
    func reorderList(_ head: ListNode?) {
           guard head != nil else {
               return
           }
           
           //找到中间节点
           var preMid: ListNode?
           var fast: ListNode? = head
           var slow: ListNode? = head
           while fast != nil { //循环终止，slow即为中间节点
               preMid = slow
               slow = slow?.next
               fast = fast?.next?.next
           }
           preMid?.next = nil //记录中间节点前一个节点，使其与前面断开（注：如何把链表从中间断开成两个链表）
           
           //翻转后面的链表
           var cur = slow //给cur赋值为第一个节点
           var pre: ListNode? //pre此时为空。
           while cur != nil {//判断cur重新赋值后有效即可循环，当循环接受，pre记录最后一个节点，即翻转后链表的头结点
               let curNext = cur?.next
               cur?.next = pre
               pre = cur
               cur = curNext
           }
           //结合两个链表，这个地方稍微画画图就可以理解了。
           cur = pre //cur表示的翻转后的后半部分链表的头结点
           var head = head //原链表前半部分的头结点
           while head != nil {
               let headNext = head!.next
               let reversedNext = cur?.next
               head?.next = cur
               cur?.next = headNext
               head = headNext
               cur = reversedNext
           }
    }
}
```
