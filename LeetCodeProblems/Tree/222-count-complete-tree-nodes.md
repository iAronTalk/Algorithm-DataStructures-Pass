# 222. Count Complete Tree Nodes - Medium
**完全二叉树的节点个数**

给出一个完全二叉树，求出该树的节点个数。

说明：

完全二叉树的定义如下：在完全二叉树中，除了最底层节点可能没填满外，其余每层节点数都达到最大值，并且最下面一层的节点都集中在该层最左边的若干位置。若最底层为第 h 层，则该层包含 1~ 2h 个节点。

```
示例:

输入:
    1
   / \
  2   3
 / \  /
4  5 6

输出: 6
```


**可能解法**

- 中序

**CODINNG**

```
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 *
//直接通过递归数节点，但是这样没有使用到完全二叉树的特性
 class Solution {
     var counts = 0
     func countNodes(_ root: TreeNode?) -> Int {
         guard let root = root else {
             return 0
         }
         let height = getHeight(root)
         return counts
     }
     func getHeight(_ root: TreeNode?) -> Void {
         if root == nil {
             return
         } else {
             counts += 1
         }
         getHeight(root!.left)
         getHeight(root!.right)
     }
 }

 class Solution {
     func countNodes(_ root: TreeNode?) -> Int {
         guard let root = root else {
             return 0
         }
         var left: TreeNode? = root
         var l1 = 0
         while left != nil {
             l1 += 1
             left = left!.left
         }
         var right: TreeNode? = root
         var l2 = 0
         while right != nil {
             l2 += 1
             right = right!.right
         }

         if l1 == l2 { //因为是完全二叉树，那么如果左右相等，那么即是满树的状态
             return 1 << l1 - 1
         } else { //如果不是那么分别去求取左右节点的个数，并记上当然节点。
             return countNodes(root.left) + countNodes(root.right) + 1
         }

     }
 }
```
