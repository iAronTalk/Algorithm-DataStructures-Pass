import UIKit
/*
 输入两棵二叉树A和B，判断B是不是A的子结构。(约定空树不是任意一个树的子结构)
 B是A的子结构， 即 A中有出现和B相同的结构和节点值。

 例如:
 给定的树 A:
      3
     / \
    4   5
   / \
  1   2
 给定的树 B：

    4
   /
  1
 返回 true，因为 B 与 A 的一个子树拥有相同的结构和节点值。

 示例 1：
 输入：A = [1,2,3], B = [3,1]
 输出：false
 示例 2：
 输入：A = [3,4,5,1,2], B = [4,1]
 输出：true
 限制：
 0 <= 节点个数 <= 10000
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
//参考了官方的答案，这个要记住
class Solution {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        return recur(A, B) || isSubStructure(A?.left, B) || isSubStructure(A?.right, B)
    }
    func recur(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if B == nil {
            return true
        }
        if A == nil || A?.val != B?.val {
            return false
        }
        return recur(A?.left, B?.left) && recur(A?.right, B?.right)
    }
}
