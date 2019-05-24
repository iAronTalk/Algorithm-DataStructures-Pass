# 199. Binary Tree Right Side View - Middle
**二叉树的右视图**

给定一棵二叉树，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。

示例:

```
输入: [1,2,3,null,5,null,4]
输出: [1, 3, 4]
解释:

   1            <---
 /   \
2     3         <---
 \     \
  5     4       <---
```

**所有可能解法**

- BFS，把每层最后一个元素加入到结果中。

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
 * }
 */
 class Solution {
     func rightSideView(_ root: TreeNode?) -> [Int] {
         guard let safeRoot = root else { return [] }

         var stack = [TreeNode]()
         stack.append(safeRoot)
         var res = [Int]()
         while !stack.isEmpty {

             var update = [TreeNode]()
             for i in 0..<stack.count {
                 let item = stack[i]
                 if i == stack.count - 1 {
                     res.append(item.val)
                 }

                 if item.left != nil {
                     update.append(item.left!)
                 }

                 if item.right != nil {
                     update.append(item.right!)
                 }
             }
             stack.removeAll()
             stack = update
         }
         return res
     }
 }
```
