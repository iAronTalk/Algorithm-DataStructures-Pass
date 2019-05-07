# 257. Binary Tree Paths - Easy
**二叉树的所有路径**

给定一个二叉树，返回所有从根节点到叶子节点的路径。

说明: 叶子节点是指没有子节点的节点。

示例:
```
输入:

   1
 /   \
2     3
 \
  5

输出: ["1->2->5", "1->3"]

解释: 所有根节点到叶子节点的路径为: 1->2->5, 1->3
```
**可能解法**

- DFS。

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
 class Solution {
     var res = [String]()
     func helper(_ root: TreeNode, _ s: String) -> Void {
         if root.left == nil && root.right == nil {
             res.append(s + String(root.val))
             return
         }

         var localS = s
         if root.left != nil {
             localS = localS + String(root.val) + "->"
             helper(root.left!, localS)
         }

         if root.right != nil {
             localS = localS + String(root.val) + "->"
             helper(root.right!, localS)
         }
     }

     func binaryTreePaths(_ root: TreeNode?) -> [String] {
         guard let safeRoot = root else { return [] }
         let temp = ""
         helper(safeRoot, temp)
         return res
     }
 }
```
