# 112. Path Sum - Easy
**路径总和**

给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和。

说明: 叶子节点是指没有子节点的节点。

示例:
```
给定如下二叉树，以及目标和 sum = 22，

              5
             / \
            4   8
           /   / \
          11  13  4
         /  \      \
        7    2      1
返回 true, 因为存在目标和为 22 的根节点到叶子节点的路径 5->4->11->2。
```

**可能解法**

- 递归

**CODINNG**

*递归*
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
 * }
 */
 class Solution {
     func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
         guard let safeRoot = root else { return false }
         if safeRoot.val == sum && safeRoot.left == nil && safeRoot.right == nil {
             return true
         }
         return hasPathSum(safeRoot.left, sum - safeRoot.val) || hasPathSum(safeRoot.right, sum - safeRoot.val)
     }
 }
```
