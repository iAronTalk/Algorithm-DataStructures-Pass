# 100. Same Tree - Easy
**相同的树**

给定两个二叉树，编写一个函数来检验它们是否相同。

如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。

**所有可能解法**

- 递推查看每个值，本文只用算法。
- 遍历，前中后，dfs，bfs都可以，查看遍历出来的结果是否一致。

**CODINNG**

*递归解法*
```
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {

        if nil == p && nil == q {
            return true
        } else if nil == p && nil != q {
            return false
        } else if nil != p && nil == q {
            return false
        }

        if p!.val == q!.val{
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
        return false
    }
}
```
