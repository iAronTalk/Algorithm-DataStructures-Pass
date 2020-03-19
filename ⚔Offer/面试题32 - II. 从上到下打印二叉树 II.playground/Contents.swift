import UIKit

/*
 从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。
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
   [9,20],
   [15,7]
 ]

 提示：
 节点总数 <= 1000
 */
//DFS，重点在于记录层的信息。
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
        guard let safeRoot = root else { return [] }
        dfs(safeRoot, 0)
        return res
    }
    func dfs(_ root: TreeNode?, _ level: Int) -> Void {
           guard let safeRoot = root else { return }
           if res.count < level + 1 {
               res.append([])
           }
           res[level].append(safeRoot.val)
           if safeRoot.left != nil  {
               dfs(safeRoot.left, level + 1)
           }
           if safeRoot.right != nil {
               dfs(safeRoot.right, level + 1)
           }
       }
}
