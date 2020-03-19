# DFS(广度优先)&BFS(深度优先)
**广度优先搜索（Breadth First Search）**

一层一层的搜索，BFS是用于图的查找算法(要求能用图表示出问题的关联性)，地毯式搜索。

*"BFS模板"*
```
visited = set()
def BFS(graph, start, end):
    if graph.root is None:
      return []

    queue = []
    visited = []
    queue.append([start])
    while queue:
        node = queue.pop()
        visited.add(node)

        process(node)
        nodeChildren = generateRelatedNodes(node)
        queue.push(nodeChildren)

    //other process work
    return processedNodes
```

**深度优先搜索（Deep First Search）**

先一个分支搜索到底，其过程简要来说是对每一个可能的分支路径深入到不能再深入为止，而且每个节点只能访问一次。

*"DFS"模板*
```
//DFS-递归写法，本身递归使用的栈的存储结构来存储递归的事件。
visited = set()
def DFS(node,visited):
  if tree.root is None:
    return []

    visited.add(node)
    //processs node...
    for next_node in node.children():
      if not next_node in visited:
        DFS(next_node,visited)
    return processedNodes
```

```
//DFS-非递归写法，常用的仍是递归形式的
visited = set()
def DFS(self,tree):
    if tree.root is None:
        return []

    visited = []
    stack = [tree.root]
    while stack:
        node = stack.pop()
        if !visited.contained(node)
          visited.add(node)

        //process node
        process(node)

        nodeChildren = generatedRelatedNodes(node)
        stack.push(nodeChildren) //这个地方要人为干涉，先push人为右边的节点，然是是左边的节点。

    //other process work
```

**BFS vs DFS**

两种搜索算法对比如下图。

![](/GeekTimeAlgorithmPass/Resources/9-BFS&DFS-1.png)

**注意：关于visited Set的使用问题**
> 如果是对于图的遍历，那么这个visitedset就是必不可少的。
> 如果是对树的遍历，那么这个visitedset就是可以省略。

**注意：BFS遍历和DFS非递归遍历，generatedRelatedNodesd如何处理，如何处理层**
> generateRelatedNodes和node.pop()操作是有关系的，即有的时候pop操作是发生在generateRelatedNodes里面的。
> BFS,DFS非递归的方式，法一：node绑定层，使用特殊的容器，容器元素为【int:int】或者queue本身就存放数组，哨兵的概念。法二：记录层的元素个数，遍历全部该层的元素。

> DFS递归的方式：法三层作为参数传递。

> 综上：BFS，只有用**法一，法二**。DFS，使用**法一，法三**。

**递归终止条件尽量往前面写，方便思考和控制**

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
      guard let safeRoot = root else { return 0 }
      return 1 + max(maxDepth(safeRoot.left),maxDepth(safeRoot.right))
    }

    //BFS做法
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let safeRoot = root else { return 0 }
        var queue = [TreeNode]()
        queue.append(safeRoot)
        var level = 0
        while queue.count > 0 {
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            level += 1
        }
        return level
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
    //DFS的方法还需要多多理解。
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
    //BFS做法，到底是BFS更容易。
    func minDepth(_ root: TreeNode?) -> Int {
       guard let safeRoot = root else { return 0 }
       var queue = [TreeNode]()
       queue.append(safeRoot)
       var minLevel = 0
       while queue.count > 0 {
           minLevel += 1
           for _ in 0..<queue.count {
               let node = queue.removeFirst()
               if node.left == nil && node.right == nil {
                   queue.removeAll()//这一步很重要，退出while循环
                   break
               }
               if node.left != nil {
                   queue.append(node.left!)
               }
               if node.right != nil {
                   queue.append(node.right!)
               }
           }
       }
       return minLevel
   }
}
```
> TESTING：leetcode

**22-括号生成-Medium**

**解题：**
> 明确题目

给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。

```例如，给出 n = 3，生成结果为：

[
  "((()))",
  "(()())",
  "(())()",
  "()(())",
  "()()()"
]```
> 所有可能解法

- 递归 + 剪枝 1）局部不满足条件的直接pass，2）左右只能各n个。

- 这道题目如果让自己想可能会有问题，所以暂请记下解题步骤慢慢体会递归和剪枝。
- 递归我的乖乖，还是想起来很烧脑，记住吧。
> CODINNG

```
  class Solution {
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

    //与方法一本质一致，注意递归终止条件放置于前面，简化思考路径。
    var res = [String]()
    func _gen(_ subString: String,_ n: Int,_ left: Int, _ right: Int) -> Void {
        if left == n && right == n {
            res.append(subString)
            return
        }
        if left < n {
            _gen(subString + "(", n, left + 1, right)
        }
        if right < left && right < n {
            _gen(subString + ")", n, left, right + 1)
        }
    }
    func generateParenthesis(_ n: Int) -> [String] {
        if n <= 0 {
            return []
        }
        _gen("", n, 0, 0)
        return res

    }
}
```
> TESTING：leetcode
