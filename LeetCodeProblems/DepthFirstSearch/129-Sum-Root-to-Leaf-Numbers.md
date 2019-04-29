# 129. Sum Root to Leaf Numbers - Medium
**求根到叶子节点数字之和**

给定一个二叉树，它的每个结点都存放一个 0-9 的数字，每条从根到叶子节点的路径都代表一个数字。

例如，从根到叶子节点路径 1->2->3 代表数字 123。

计算从根到叶子节点生成的所有数字之和。

说明: 叶子节点是指没有子节点的节点。

```
示例 1:

输入: [1,2,3]
    1
   / \
  2   3
输出: 25
解释:
从根到叶子节点路径 1->2 代表数字 12.
从根到叶子节点路径 1->3 代表数字 13.
因此，数字总和 = 12 + 13 = 25.
示例 2:

输入: [4,9,0,5,1]
    4
   / \
  9   0
 / \
5   1
输出: 1026
解释:
从根到叶子节点路径 4->9->5 代表数字 495.
从根到叶子节点路径 4->9->1 代表数字 491.
从根到叶子节点路径 4->0 代表数字 40.
因此，数字总和 = 495 + 491 + 40 = 1026.
```

**可能解法**

- DFS。

**CODINNG**

*解法一*
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
     var result = 0
     var visited = 0
     func dfs(_ root: TreeNode?) -> Void {
         guard let safeRoot = root else { return }
         visited = visited * 10 + safeRoot.val
         if safeRoot.left == nil && safeRoot.right == nil {
             result += visited
         }
         dfs(safeRoot.left)
         dfs(safeRoot.right)

         //遍历当前层结束后，删除当前层的累积，类似于leetcode113题目
         visited = (visited - safeRoot.val) / 10
     }

     func sumNumbers(_ root: TreeNode?) -> Int {
         guard let safeRoot = root else { return 0 }
         dfs(safeRoot)
         return result
     }
 }
```
*解法二 - 极简递归*
```
class Solution {
    func dfs(_ root: TreeNode?, _ visited: Int) -> Int {
        guard let safeRoot = root else { return 0 }

        var sum = 0
        if safeRoot.left != nil {
            sum += dfs(safeRoot.left, safeRoot.val + visited * 10)
        }
        if safeRoot.right != nil {
            sum += dfs(safeRoot.right, safeRoot.val + visited * 10)
        }
        return sum == 0 ? (safeRoot.val + visited * 10) : sum
    }

    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let safeRoot = root else { return 0 }
        return dfs(safeRoot, 0)
    }
}
```
