# 94. Binary Tree Inorder Traversal - Medium
**二叉树的中序遍历**

给定一个二叉树，返回它的中序 遍历。

**所有可能解法**

- 递归中序
- 迭代中序

**CODINNG**

*递归解法*
```
class Solution {
    var res = [Int]()
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let safeRoot = root else {
            return []
        }
        inorderTraversal(safeRoot.left)
        res.append(safeRoot.val)
        inorderTraversal(safeRoot.right)
        return res
    }
}
```

*迭代解法*
```
class Solution {
    var res = [Int]()
    var stack = [TreeNode]()
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let safeRoot = root else {
            return []
        }

        var cur: TreeNode? = safeRoot
        while !stack.isEmpty || cur != nil {
            while cur != nil {
                push(cur!)
                cur = cur!.left
            }

            cur = pop()
            res.append(cur!.val)
            cur = cur!.right
        }
        return res
    }

    func push(_ treeNode: TreeNode) {
        stack.append(treeNode)
    }
    func pop() -> TreeNode? {
        return stack.removeLast()
    }
}
```
