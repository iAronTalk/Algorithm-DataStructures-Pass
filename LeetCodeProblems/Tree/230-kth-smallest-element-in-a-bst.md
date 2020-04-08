# 230. Kth Smallest Element In-a-BST - Medium
**二叉搜索树中第K小的元素**

给定一个二叉搜索树，编写一个函数 kthSmallest 来查找其中第 k 个最小的元素。

说明：
你可以假设 k 总是有效的，1 ≤ k ≤ 二叉搜索树元素个数。

```
示例 1:

输入: root = [3,1,4,null,2], k = 1
   3
  / \
 1   4
  \
   2
输出: 1
示例 2:

输入: root = [5,3,6,2,4,null,null,1], k = 3
       5
      / \
     3   6
    / \
   2   4
  /
 1
输出: 3
```
进阶：
如果二叉搜索树经常被修改（插入/删除操作）并且你需要频繁地查找第 k 小的值，你将如何优化 kthSmallest 函数？

**可能解法**

- 中序

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

// 比较easy-going的解法。
class Solution {
    func help(_ root: TreeNode?) -> [Int] {
        if root == nil {return []}
        let res = help(root!.left) + [root!.val] + help(root!.right)
        return res
    }
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {return 0}
        let res = help(root!)
        return res[k-1]
    }
}
//参考官方的答案
class Solution37 {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {return 0}
        var root = root
        var k = k
        var stack = [TreeNode]()
        stack.append(root!)
        while true {
            while root != nil {
                stack.append(root!)
                root = root!.left
            }
            if !stack.isEmpty {
                root = stack.removeLast()
                k -= 1
                if k == 0 {
                    return root!.val
                }
                root = root!.right
            } else {
                return -1
            }
        }
    }
}
```
