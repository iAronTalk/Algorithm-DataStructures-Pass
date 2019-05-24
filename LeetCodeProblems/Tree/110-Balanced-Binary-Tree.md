# 110. Balanced Binary Tree - Easy
**平衡二叉树**

给定一个二叉树，判断它是否是高度平衡的二叉树。

本题中，一棵高度平衡二叉树定义为：

一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。

示例 1:

```
给定二叉树 [3,9,20,null,null,15,7]

    3
   / \
  9  20
    /  \
   15   7
返回 true 。
```

示例 2:

```
给定二叉树 [1,2,2,3,3,null,null,4,4]

       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
返回 false 。
```

**所有可能解法**

- 递归

- github上其他优秀解法:https://leetcode.com/problems/balanced-binary-tree/discuss/157645/Python-Tree-tm。

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
    func getHeight(_ root: TreeNode?) -> Int {
        guard let safeRoot = root else { return 0 }
        let left = getHeight(safeRoot.left)
        let right = getHeight(safeRoot.right)

        if left == -1 || right == -1 {
            return -1
        }

        if abs(left - right) > 1 {
            return -1
        }

        return max(left, right) + 1
    }

    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let safeRoot = root else {
            return true
        }

        let height = getHeight(safeRoot)
        return height != -1
    }
}
```
