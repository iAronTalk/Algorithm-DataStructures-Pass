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
        //因为要一直延续到叶子节点。
        if safeRoot.left == nil && safeRoot.right == nil && safeRoot.val == sum {
            res.append(list)
        }

        pathSum(safeRoot.left, sum - safeRoot.val)
        pathSum(safeRoot.right, sum - safeRoot.val)

        //这点非常重要，遍历完当前层，回复list原样，删除当前层的节点，递归中的每一层都会删除该层加入list中的元素。
        list.removeLast()
        return res;
    }
}

方法二，list作为参数传入到递归中，省却一步复原操作。凡是使用全局变量的情况，一定要考虑复原的操作。
class Solution {
    var res = [[Int]]()
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard root != nil else {
            return []
        }
        self.DFS(root, sum, [])
        return res
    }
    func DFS(_ root: TreeNode?, _ sum: Int, _ list: [Int]) -> Void {
        guard root != nil else {
            return
        }
        var list = list
        list.append(root!.val)
        if root!.left == nil && root!.right == nil && root!.val == sum {
            res.append(list)
            return
        }
        if root!.left != nil {
            DFS(root!.left, sum - root!.val, list)
        }
        if root!.right != nil {
            DFS(root!.right, sum - root!.val, list)
        }
    }
}

```
