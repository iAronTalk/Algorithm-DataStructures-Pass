import UIKit
/*
 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。
 参考以下这颗二叉搜索树：

      5
     / \
    2   6
   / \
  1   3
 示例 1：

 输入: [1,6,3,2,5]
 输出: false
 示例 2：

 输入: [1,3,2,6,5]
 输出: true
 
 提示：
 数组长度 <= 1000
 */

//真是一道折磨人的题目。
class Solution {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        return recur(postorder)
    }
    
    func recur(_ postorder: [Int]) -> Bool {
        if postorder.count == 1 || postorder.count == 0 { //这里，当只有一个节点或者无节点，认为是。
            return true
        }
        var i = 0
        let length = postorder.count
        let root = postorder.last!
        for num in postorder[0..<length - 1] { //注意剔除最后一个元素，即根节点。
            if num > root {
                break
            }
            i += 1
        }
        if i < length - 1 {
            for num in postorder[i..<length - 1] { //查看右半部分节点是否满足条件。
                if num < root {
                    return false
                }
            }
        }
        
        var left = true
        if i > 0 {
            left = self.recur(Array(postorder[0..<i])) //递归左边的子树，看看是否满足条件。
        }
        
        var right = true
        if i < length - 1 {
            right = verifyPostorder(Array(postorder[i..<length - 1])) //递归右边的子树，看是否满足条件。
        }
        
        return left && right
    }
}

let s = Solution()
let r = s.verifyPostorder([4, 6, 7, 5])
print(r)
