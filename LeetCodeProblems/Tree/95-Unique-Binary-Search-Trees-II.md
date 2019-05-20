# 95. Unique Binary Search Trees II - Medium
**不同的二叉搜索树 II**

给定一个整数 n，生成所有由 1 ... n 为节点所组成的二叉搜索树。

示例:

```
输入: 3
输出:
[
  [1,null,3,2],
  [3,2,null,1],
  [3,1,null,null,2],
  [2,1,3],
  [1,null,2,null,3]
]
解释:
以上的输出对应以下 5 种不同结构的二叉搜索树：

   1         3     3      2      1
    \       /     /      / \      \
     3     2     1      1   3      2
    /     /       \                 \
   2     1         2                 3
```

**所有可能解法**

- 递归，[参考链接](https://www.laojiyou.com/books/shujujgsf/exhaustive_search/unique_binary_search_trees_ii.html)。
- DP

**CODINNG**

*递归解法*
```
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {

    func help(_ start: Int, _ end: Int) -> [TreeNode?] {
        var res = [TreeNode?]()

        if start > end {
            res.append(nil)
            return res
        }

        for i in start...end {
            let leftTree = help(start, i - 1)
            let rightTree = help(i + 1, end)

            for j in 0..<leftTree.count {
                for k in 0..<rightTree.count {
                    let root = TreeNode.init(i)
                    root.left = leftTree[j]
                    root.right = rightTree[k]
                    res.append(root)
                }
            }
        }
        return res
    }
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 { return [] }
        return help(1, n)
    }
}
```
