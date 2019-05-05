# 111. Minimum Depth of Binary Tree - Easy
**二叉树的最小深度**

给定一个二叉树，找出其最小深度。
最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

说明: 叶子节点是指没有子节点的节点。
示例:

```
给定二叉树 [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
返回它的最小深度  2.
```

**可能解法**

- BFS，本例使用的。
- DFS

**CODINNG**

*BFS*
```
class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let safeRoot = root else { return 0 }

        var queue = [TreeNode]()
        queue.append(safeRoot)
        var res = 0

        while queue.count > 0 {
            var returnLevel = false
            for item in queue {
                if item.left != nil {
                    queue.append(item.left!)
                }

                if item.right != nil {
                    queue.append(item.right!)
                }

                if item.left == nil && item.right == nil {
                    returnLevel = true
                }
                queue.removeFirst()
            }
            res += 1
            if returnLevel { return res }
        }

        return res
    }
}
```
