import UIKit

/*
 从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回：

 [3,9,20,15,7]
  
 提示：

 节点总数 <= 1000
 */

//BFS
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
    func levelOrder(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        var queue = [TreeNode]()
        queue.append(root!)
        var res = [Int]()
        while !queue.isEmpty {
            let tmpNode = queue.removeFirst()
            res.append(tmpNode.val)
            if tmpNode.left != nil {
                queue.append(tmpNode.left!)
            }
            if tmpNode.right != nil {
                queue.append(tmpNode.right!)
            }
        }
        return res
    }
}
