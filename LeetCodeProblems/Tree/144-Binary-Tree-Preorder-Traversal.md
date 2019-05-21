# 144. Binary Tree Preorder Traversal - Medium
**二叉树的前序遍历**

给定一个二叉树，返回它的 前序 遍历。

示例:
```
输入: [1,null,2,3]  
   1
    \
     2
    /
   3

输出: [1,2,3]
进阶: 递归算法很简单，你可以通过迭代算法完成吗？
```
**可能解法**

- 递归
- 迭代

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

// 递归
class Solution {
   var res = [Int]()
   func preorderTraversal(_ root: TreeNode?) -> [Int] {
       guard let safeRoot = root else { return [] }

       res.append(safeRoot.val)
       preorderTraversal(root?.left)
       preorderTraversal(root?.right)

       return res
   }
}
```
