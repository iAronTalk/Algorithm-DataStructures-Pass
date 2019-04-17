# 106. Construct Binary Tree from Inorder and Postorder Traversal - Middle
**从中序与后序遍历序列构造二叉树**

根据一棵树的中序遍历与后序遍历构造二叉树。

**所有可能解法**

**CODINNG**

*递归解法*
```
class Solution {
    func helper(_ inorder: [Int], _ postorder: [Int], postEnd: Int, inStart: Int, inEnd: Int) -> TreeNode? {

        // 提前判断
        if inStart > inEnd {
            return nil
        }
        // 易错点
        var inIndex = 0
        for i in inStart...inEnd {
            if inorder[i] == postorder[postEnd] {
                inIndex = i
                break
            }
        }

        let root = TreeNode.init(postorder[postEnd])
        // 重点分析左树和右树的起终点
        let left = helper(inorder, postorder, postEnd: postEnd - (inEnd - inIndex) - 1, inStart: inStart, inEnd: inIndex - 1)
        let right = helper(inorder, postorder, postEnd: postEnd - 1, inStart: inIndex + 1, inEnd: inEnd)
        root.left = left
        root.right = right
        return root
    }

    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if 0 == inorder.count || 0 == postorder.count {
            return nil
        }

        return helper(inorder, postorder, postEnd: postorder.count - 1, inStart: 0, inEnd: inorder.count - 1)
    }
}
```
