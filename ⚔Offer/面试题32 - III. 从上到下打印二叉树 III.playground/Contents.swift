import UIKit

/*
 请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：
 [
   [3],
   [20,9],
   [15,7]
 ]
 提示：
 节点总数 <= 1000
 */
//DFS
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
    var res = [[Int]]()
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return []
        }
        DFS(root, 0)
        return res
    }
    func DFS(_ root: TreeNode?, _ level: Int) -> Void {
        guard root != nil else {
            return
        }
        if res.count < level + 1 {
            res.append([])
        }
        if level & 1 == 1 {
            res[level].insert(root!.val, at: 0)
        } else {
            res[level].append(root!.val)
        }
        DFS(root?.left, level + 1)
        DFS(root?.right, level + 1)
    }
}
