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

class Solution {
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else {
            return nil
        }
        var queue = [TreeNode]()
        queue.append(root!)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let nodeLeft = node.left
            node.left = node.right
            node.right = nodeLeft
            if node.left != nil {
                queue.append(node.left!)
            }
            if node.right != nil {
                queue.append(node.right!)
            }
        }
        return root
    }
}
