# 102. Binary Tree Level Order Traversal - Medium
**二叉树的层次遍历**

给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。

例如:
```
给定二叉树: [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
返回其层次遍历结果：

[
  [3],
  [9,20],
  [15,7]
]
```

**可能解法**

- BFS
- DFS

**CODINNG**

*DFS*
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
    var result = [[Int]]()

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let safeNode = root else {
            return []
        }

        self._dfs(safeNode, level: 0)
        return result;
    }

    func _dfs(_ root: TreeNode?, level: Int) -> Void {
        if root == nil {
            return
        }

        if result.count < level + 1 {
            result.append([])
        }

        result[level].append((root?.val)!)
        self._dfs(root?.left, level: level + 1)
        self._dfs(root?.right, level: level + 1)
    }
}
```

*BFS*
```
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let safeRoot = root else {
            return []
        }

        var queue = [TreeNode]()
        queue.append(safeRoot)
        //图的话需要存储访问过的节点var visited = []
        var result = [[Int]]()

        while queue.count > 0 {
            var currentLevel = [Int]()

            for _ in queue {
                let node = queue.removeFirst()
                currentLevel.append(node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }

            result.append(currentLevel)
        }

        return result;
    }
}
```
