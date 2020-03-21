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

//这道题有比较麻烦的办法，如求出镜像的树，然后遍历一遍，看看是否镜像。
//下面的办法是借鉴的。
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard root != nil else {
            return true
        }
        return recur(root?.left, root?.right)
    }
    
    func recur(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil || left!.val != right!.val {
            return false
        }
        return recur(left!.left, right!.right) && recur(left!.right, right!.left)
    }
}
