# 114. Flatten Binary Tree to Linked List - Medium
**二叉树展开为链表**

给定一个二叉树，原地将它展开为链表。

```
例如，给定二叉树

    1
   / \
  2   5
 / \   \
3   4   6
将其展开为：

1
 \
  2
   \
    3
     \
      4
       \
        5
         \
          6
```


**可能解法**

步骤:
- 把右子树临时存起来，tempRight。
- 根节点的右子树改变为左子树，并将左子树置空。
- 找到右子树的最后一个节点，将临时存起来的tempRight链接到最后一个节点。

- **最重要的，针对每个非空节点进行上诉的相同操作**
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
    func flatten(_ root: TreeNode?) {
        guard let safeRoot = root else { return }
        
        if safeRoot.left != nil {
            flatten(safeRoot.left)
        }
        if safeRoot.right != nil {
            flatten(safeRoot.right)
        }

        let tempRight = safeRoot.right
        safeRoot.right = safeRoot.left
        safeRoot.left = nil

        var localRoot = safeRoot
        while localRoot.right != nil {
            localRoot = localRoot.right!
        }

        localRoot.right = tempRight
    }
}
```
