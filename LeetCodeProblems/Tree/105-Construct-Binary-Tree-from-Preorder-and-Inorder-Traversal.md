# 105. Construct Binary Tree from Preorder and Inorder Traversal - Medium

**从前序与中序遍历序列构造二叉树**

根据一棵树的前序遍历与中序遍历构造二叉树。

注意:
你可以假设树中没有重复的元素。

**所有可能解法**

**CODINNG**

*递归解法*
```
class Solution {
    //分别构建每个子树的遍历，选好头结点和尾节点。
    func helper(_ preorder: [Int], _ inorder: [Int], preStart: Int, preEnd: Int, inStart: Int, inEnd: Int) -> TreeNode? {

        if inStart > inEnd {
            return nil
        }

        if preStart > preEnd {
            return nil
        }
        var inIndex = 0
        let cur = preorder[preStart]
        for i in inStart...inEnd {
            if cur == inorder[i] {
                inIndex = i
                break
            }
        }

        let root = TreeNode.init(cur)
        let leftLength = inIndex - inStart
        let rightLength = inEnd - inIndex

        let left = helper(preorder, inorder, preStart: preStart + 1, preEnd: preStart + leftLength, inStart: inStart, inEnd: inIndex - 1)

        let right = helper(preorder, inorder, preStart: preEnd - rightLength + 1, preEnd: preEnd, inStart: inIndex + 1, inEnd: inEnd)

        root.left = left
        root.right = right
        return root
    }

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if 0 == preorder.count || 0 == inorder.count {
            return nil
        }

        return helper(preorder, inorder, preStart: 0, preEnd: preorder.count - 1, inStart: 0, inEnd: inorder.count - 1)
    }
}
```
