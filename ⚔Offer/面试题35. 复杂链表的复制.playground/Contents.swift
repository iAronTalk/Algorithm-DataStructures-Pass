import UIKit

/*
 请实现 copyRandomList 函数，复制一个复杂链表。在复杂链表中，每个节点除了有一个 next 指针指向下一个节点，还有一个 random 指针指向链表中的任意节点或者 null。
 示例 1：
 输入：head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
 输出：[[7,null],[13,0],[11,4],[10,2],[1,0]]
 示例 2：
 
 输入：head = [[1,1],[2,1]]
 输出：[[1,1],[2,1]]
 示例 3：

 输入：head = [[3,null],[3,0],[3,null]]
 输出：[[3,null],[3,0],[3,null]]
 示例 4：

 输入：head = []
 输出：[]
 解释：给定的链表为空（空指针），因此返回 null。

 提示：
 -10000 <= Node.val <= 10000
 Node.random 为空（null）或指向链表中的节点。
 节点数目不超过 1000 。
  
 注意：本题与主站 138 题相同：https://leetcode-cn.com/problems/copy-list-with-random-pointer/
 */

//这里swift版本在leetcode上编译有问题。附上python版本
public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

extension Node: Equatable {
    public static func == (_ lhs: Node, _ rhs: Node) -> Bool {
        return lhs === rhs
    }
}

extension Node: Hashable {
    public var hashValue: Int {
        return val * self.next?.val * self.random?.val
    }
}
class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard head != nil else {
            return nil
        }
        return def(head)
    }
    var visited = [Node: Node]()
    func def(_ head: Node?) -> Node? {
        guard let head = head else { return nil }
        if visited.keys.contains(head) {
            return visited[head]
        }
        let copy = Node.init(head.val)
        visited[head] = copy
        copy.next = def(head.next)
        copy.random = def(head.random)
        return copy
    }
}

// class Solution:
//     def copyRandomList(self, head: 'Node') -> 'Node':
//         def dfs(head):
//             if not head: return None
//             if head in visited:
//                 return visited[head]
//             # 创建新结点
//             copy = Node(head.val, None, None)
//             visited[head] = copy
//             copy.next = dfs(head.next)
//             copy.random = dfs(head.random)
//             return copy
//         visited = {}
//         return dfs(head)

