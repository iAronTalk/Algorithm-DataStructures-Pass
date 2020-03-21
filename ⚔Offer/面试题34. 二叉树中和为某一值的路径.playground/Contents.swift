import UIKit
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
//题目有两个主意点
//1.从跟节点到叶子节点才算数，要审题清楚。
//2.注意可以为负数的情况。
class Solution {
    var res = [[Int]]()
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard root != nil else {
            return []
        }
        var visited = [Int]()
        BFS(root, sum, visited)
        return res
    }
    
    func BFS(_ root: TreeNode?, _ sum: Int, _ visited: [Int]) -> Void {
        guard root != nil else {
            return
        }
        var visited = visited
        visited.append(root!.val)
        if (sum - root!.val) == 0 && visited.count != 0 && root!.left == nil && root!.right == nil {
            res.append(visited)
        }
        BFS(root?.left, sum - root!.val, visited)
        BFS(root?.right, sum - root!.val, visited)
    }
}
