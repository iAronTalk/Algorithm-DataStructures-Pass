import UIKit

public class TreeNode {
   public var val: Int
   public var left: TreeNode?
   public var right: TreeNode?
   public init() { self.val = 0; self.left = nil; self.right = nil; }
   public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
   public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
       self.val = val
       self.left = left
       self.right = right
   }
}

class Solution {
    
    //124
    var res = Int.min
    func maxPathSum(_ root: TreeNode?) -> Int {
        _dfs(root)
        return res
    }
    
    func _dfs(_ root: TreeNode?) -> Int {
        guard let safeRoot = root else { return 0 }
        let left  = max(0, _dfs(safeRoot.left))
        let right = max(0, _dfs(safeRoot.right))
        res = max(res, left + right + safeRoot.val)
        return max(left, right) + safeRoot.val
    }
    
    // 105
    var map: [Int: Int] = [:]
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 || inorder.count == 0 {
            return nil
        }
        for (index, obj) in inorder.enumerated() {
            map[obj] = index
        }
        return helper(preorder, inorder, 0, preorder.count - 1, 0, inorder.count - 1)
    }
    
    func helper(_ preorder: [Int], _ inorder: [Int], _ preStart: Int, _ preEnd: Int, _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        if preStart > preEnd || inStart > inEnd {
            return nil
        }
        let root = TreeNode.init(preorder[preStart])
        let inRoot = map[root.val]!
        let numsLeft = inRoot - inStart
        root.left = helper(preorder, inorder, preStart + 1, preStart + numsLeft, inStart, inRoot - 1)
        root.right = helper(preorder, inorder, preStart + numsLeft + 1, preEnd, inRoot + 1, inEnd)
        return root;
    }
    
    //99 O(1)
    var treeX: TreeNode?
    var treeY: TreeNode?
    var pre: TreeNode?
    func recoverTree(_ root: TreeNode?) {
        _helperRecoverTree(root)
        if treeX != nil && treeY != nil {
            let temp = treeY!.val
            treeY!.val = treeX!.val
            treeX!.val = temp
        }
    }
    
    func _helperRecoverTree(_ root: TreeNode?) {
        if root == nil {
            return
        }
        _helperRecoverTree(root!.left)
        
        if (pre != nil) && root!.val > pre!.val {
            treeY = root
            if treeX == nil {
                treeX = pre
            }
        }
        pre = root
    }
}
