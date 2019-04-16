# DFS(广度优先)&BFS(深度优先)
**广度优先搜索（Breadth First Search）**

一层一层的搜索，BFS是用于图的查找算法(要求能用图表示出问题的关联性)，地毯式搜索。

*"BFS模板"*
```
visited = set()
def BFS(graph, start, end):

    queue = []
    queue.append([start])
    visited.add(start)

    while queue:
        node = queue.pop()
        visited.add(node)

        process(node)
        nodes = generateRelatedNodes(node)
        queue.push(nodes)

    //other process work
```

**深度优先搜索（Deep First Search）**

先一个分支搜索到底，其过程简要来说是对每一个可能的分支路径深入到不能再深入为止，而且每个节点只能访问一次。

*"DFS"模板*
```
//DFS-递归写法
visited = set()
def DFS(node,visited):
    visited.add(node)

    //processs node
for next_node in node.children():
    if not next_node in visited:
        DFS(next_node,visited)
```

```
//DFS-非递归写法，常用的仍是递归形式的
visited = set()
def DFS(self,tree):

    if tree.root is Node:
        return []

    visited, stack = [], [tree.root]

    while stack:
        node = stack.pop()
        visited.add(node)

        //process node
        process(node)
        nodes = generatedRelatedNodes(node)
        stack.push(nodes)

    //other process work
```

**BFS vs DFS**

两种搜索算法对比如下图。

![](/GeekTimeAlgorithmPass/Resources/9-BFS&DFS-1.png)
## Leetcode真题

**102-二叉树的层次遍历-Medium**

**解题：**
> 明确题目

给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。即BFS

> 所有可能解法

- BFS，本题限定了按层输出。
- DFS也可以，搜索的时候记录每个元素所在的层数。

> CODINNG

*BFS*
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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let safeRoot = root else {
            return []
        }

        var queue = [TreeNode]()
        queue.append(safeRoot)
        //图的话需要存储访问过的节点var visited = []
        var result = [[Int]]()

        while queue.count > 0 {
            var currentLevel = [Int]()

            for _ in queue {
                let node = queue.removeFirst()
                currentLevel.append(node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }

            result.append(currentLevel)
        }

        return result;
    }
}
```

*DFS*
```
//TreeNode数据结构同上题目
 class Solution {
    var result = [[Int]]()

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let safeNode = root else {
            return []
        }

        self._dfs(safeNode, level: 0)
        return result;
    }

    func _dfs(_ root: TreeNode?, level: Int) -> Void {
        if root == nil {
            return
        }

        if result.count < level + 1 {
            result.append([])
        }

        result[level].append((root?.val)!)
        self._dfs(root?.left, level: level + 1)
        self._dfs(root?.right, level: level + 1)
    }
}
```
> TESTING：leetcode

**104-二叉树的最大深度-Easy**

**解题：**
> 明确题目

给定一个二叉树，找出其最大深度。

二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

说明: 叶子节点是指没有子节点的节点。

> 所有可能解法

- BFS
- DFS

> CODINNG

```
//TreeNode数据结构同上题目
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return 1 + max(maxDepth(root!.left),maxDepth(root!.right))
    }
}
```
> TESTING：leetcode

**111-二叉树的最小深度-Easy**

**解题：**
> 明确题目

给定一个二叉树，找出其最小深度。

最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

说明: 叶子节点是指没有子节点的节点。

> 所有可能解法

- BFS
- DFS

> CODINNG

```
//TreeNode数据结构同上题目
class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }

        let left = minDepth(root!.left)
        let right = minDepth(root!.right)

        if left == 0 || right == 0 {
            return left + right + 1
        } else {
            return 1 + min(left,right)
        }
    }
}
```
> TESTING：leetcode

**22-括号生成-Medium**

**解题：**
> 明确题目

给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。

> 所有可能解法

- 递归 + 剪枝

> CODINNG

```
】class Solution {
    var result = [String]()

    func generateParenthesis(_ n: Int) -> [String] {

        _gen("", left: n, right: n)
        return result
    }

    func _gen(_ sub: String, left: Int, right: Int) -> Void {
        if left == 0 && right == 0 {
            result.append(sub)
            return
        }

        if left > 0 {
            _gen(sub + "(", left: left - 1, right: right)
        }

        if right > left {
            _gen(sub + ")", left: left, right: right - 1)
        }
    }
}
```
> TESTING：leetcode
