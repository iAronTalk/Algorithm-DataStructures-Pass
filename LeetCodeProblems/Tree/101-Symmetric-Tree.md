# 101. Symmetric Tree - Easy
**对称二叉树**

给定一个二叉树，检查它是否是镜像对称的。

例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

```
    1
   / \
  2   2
 / \ / \
3  4 4  3
```

但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
```
     1
    / \
   2   2
   \   \
   3    3
```
**所有可能解法**

- 递归
- 迭代

**CODINNG**

*递归解法*
```
class Solution1 {
    func isMirror(_ l1: TreeNode?, l2: TreeNode?) -> Bool {
        if l1 == nil && l2 == nil {
            return true
        }

        if l1 == nil || l2 == nil {
            return false
        }

        if (l1?.val == l2?.val) && isMirror(l1?.left, l2: l2?.right) && isMirror(l1?.right, l2: l2?.left) {
            return true
        }
        return false
    }
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let safeRoot = root else { return true }
        return isMirror(safeRoot, l2: safeRoot)
    }
}
```
