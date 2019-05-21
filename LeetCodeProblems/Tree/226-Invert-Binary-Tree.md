# 26. Invert Binary Tree - Medium
**翻转二叉树**

翻转一棵二叉树。

示例：

```
输入：

     4
   /   \
  2     7
 / \   / \
1   3 6   9
输出：

     4
   /   \
  7     2
 / \   / \
9   6 3   1
```
备注:
这个问题是受到 Max Howell 的 原问题 启发的 ：

谷歌：我们90％的工程师使用您编写的软件(Homebrew)，但是您却无法在面试时在白板上写出翻转二叉树这道题，这太糟糕了。

**可能解法**

- 递归

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
   func invertTree(_ root: TreeNode?) -> TreeNode? {
       guard let safeRoot = root else { return nil }
       let tempLeft = safeRoot.left
       safeRoot.left = invertTree(safeRoot.right)
       safeRoot.right = invertTree(tempLeft)
       return safeRoot
   }
}
```
