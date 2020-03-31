# 124.Binary Tree Maximum Path Sum - Hard
**二叉树中的最大路径和**

给定一个非空二叉树，返回其最大路径和。

本题中，路径被定义为一条从树中任意节点出发，达到任意节点的序列。该路径至少包含一个节点，且不一定经过根节点。

```示例 1:

输入: [1,2,3]

       1
      / \
     2   3

输出: 6
示例 2:

输入: [-10,9,20,null,null,15,7]

   -10
   / \
  9  20
    /  \
   15   7

输出: 42
```

**可能解法**

- 递归,深度优先，后根遍历。

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
class Solution25 {
    var res = Int.min
    func maxPathSum(_ root: TreeNode?) -> Int {
        dfs(root)
        return res
    }

    func dfs(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        let left = max(0, dfs(root!.left))
        let right = max(0, dfs(root!.right))
        res = max(res, left + right + root!.val)
        return max(left, right) + root!.val
    }
}
```
