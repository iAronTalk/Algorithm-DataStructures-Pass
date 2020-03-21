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

//这种接法，两层递归。
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard root != nil else {
            return true
        }
        let left = self.depth(root?.left)
        let right = self.depth(root?.right)
        return abs(left - right) <= 1 && self.isBalanced(root?.left) && self.isBalanced(root?.right)
    }
    func depth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return max(depth(root?.left), depth(root?.right)) + 1
    }
}
