# 145. Binary Tree Postorder Traversal - Hard
**二叉树的后序遍历**

给定一个二叉树，返回它的 后序 遍历。

```
示例:

输入: [1,null,2,3]  
   1
    \
     2
    /
   3

输出: [3,2,1]
```
进阶: 递归算法很简单，你可以通过迭代算法完成吗？


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
    var res = [Int]()
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {return []}
        postorderTraversal(root!.left)
        postorderTraversal(root!.right)
        res.append(root!.val)
        return res
    }
}

// 迭代，leetcode官方无耻的解法，不是严格的后续遍历
class Solution {
    var res = [Int]()
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {return []}
        var stack = [TreeNode]()
        stack.append(root!)
        while !stack.isEmpty {
            let cur = stack.removeLast()
            res.insert(cur.val, at: 0)
            if cur.left != nil {
                stack.append(cur.left!)
            }
            if cur.right != nil {
                stack.append(cur.right!)
            }
        }
        return res
    }
}

//严格后续遍历
class Solution {
  public List<Integer> postorderTraversal(TreeNode root) {
    LinkedList<TreeNode> stack = new LinkedList<>();
    LinkedList<Integer> output = new LinkedList<>();
    if (root == null) {
      return output;
    }

    stack.add(root);
    while (!stack.isEmpty()) {
      TreeNode node = stack.pollLast();
      output.addFirst(node.val);
      if (node.left != null) {
        stack.add(node.left);
      }
      if (node.right != null) {
        stack.add(node.right);
      }
    }
    return output;
  }
}
```
