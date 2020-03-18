import UIKit

/*
 输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。

  

 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7
  

 限制：

 0 <= 节点个数 <= 5000
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
    }
}


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
        //先根遍历的第一个是root，找到其在中根中的位置，将树分为左和右子树
        let cur = preorder[preStart]
        for i in inStart...inEnd {
            if cur == inorder[i] {
                inIndex = i
                break
            }
        }

        let root = TreeNode.init(cur)
        let leftLength = inIndex - inStart //左子树元素个数
        let rightLength = inEnd - inIndex //右子树元素个数
        //分别对左子树递归操作，同理，此时并无法确切知道左子树在先根的范围
        //要算，(preStart + 1,preStart + leftLength)
        let left = helper(preorder, inorder, preStart: preStart + 1, preEnd: preStart + leftLength, inStart: inStart, inEnd: inIndex - 1)
        //此时并不知道右子树在先根的范围，要算：(preEnd - rightLength + 1， preEnd)
        let right = helper(preorder, inorder, preStart: preEnd - rightLength + 1, preEnd: preEnd, inStart: inIndex + 1, inEnd: inEnd)
        //重建二叉树
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
