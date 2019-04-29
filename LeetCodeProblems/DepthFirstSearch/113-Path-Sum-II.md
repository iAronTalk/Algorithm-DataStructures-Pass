# 113. Path Sum II - Medium
**路径总和 II**

给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径。

说明: 叶子节点是指没有子节点的节点。

```
示例:
给定如下二叉树，以及目标和 sum = 22，

              5
             / \
            4   8
           /   / \
          11  13  4
         /  \    / \
        7    2  5   1
返回:

[
   [5,4,11,2],
   [5,8,4,5]
]
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

    var res = [[Int]]()
    var list = [Int]()

    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard let safeRoot = root else { return res }
        list.append(safeRoot.val)
        if safeRoot.left == nil && safeRoot.right == nil && safeRoot.val == sum{
            res.append(list)
        }

        pathSum(safeRoot.left, sum - safeRoot.val)
        pathSum(safeRoot.right, sum - safeRoot.val)

        //这点非常重要，遍历完当前层，回复list原样，删除当前层的节点。
        list.removeLast()
        return res;
    }
}

```
