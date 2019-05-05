# 103. Binary Tree Zigzag Level Order Traversal - Medium
**二叉树的锯齿形层次遍历**

给定一个二叉树，返回其节点值的锯齿形层次遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。

例如：
```
给定二叉树 [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
返回锯齿形层次遍历如下：

[
  [3],
  [20,9],
  [15,7]
]
```

**可能解法**

- BFS。

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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let safeRoot = root else { return [] }

        var queue = [TreeNode]()
        queue.append(safeRoot)
        var result = [[Int]]()

        var level = 0 //偶数从左到右，奇数从右到左
        while queue.count > 0 {
            var curretLevel = [Int]()
            for item in level % 2 == 1 ? queue.reversed() : queue {
                curretLevel.append(item.val)
            }

            for item in queue {
                if item.left != nil {
                    queue.append(item.left!)
                }
                if item.right != nil {
                    queue.append(item.right!)
                }

                queue.removeFirst()
            }
            result.append(curretLevel)
            level += 1
        }
        return result
    }
 }

```
