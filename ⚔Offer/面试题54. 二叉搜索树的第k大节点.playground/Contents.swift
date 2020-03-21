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
    var treeArray = [Int]()
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        guard root != nil && k >= 1 else {
            return 0
        }
        self.inOrder(root)
        if k <= treeArray.count {
            return treeArray[treeArray.count - k]
        }
        return 0
    }
    
    func inOrder(_ root: TreeNode?) -> Void {
        guard root != nil else {
            return
        }
        inOrder(root?.left)
        treeArray.append(root!.val)
        inOrder(root?.right)
    }
}

class Solution2 {
    var treeArray = [Int]()
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        guard root != nil && k >= 1 else {
            return 0
        }
        var k = k
        
        return self.inOrder(root, &k)?.val ?? 0
    }
    
    func inOrder(_ root: TreeNode?, _ k: inout Int) -> TreeNode? {
        guard root != nil else {
            return nil
        }
        var target: TreeNode? = nil
        target = inOrder(root?.right, &k)
        if target == nil {
            if k == 1 {
                target = root
            }
            k -= 1
        }
        if target == nil {
            target = inOrder(root?.left, &k)
        }
        return target
    }
}
