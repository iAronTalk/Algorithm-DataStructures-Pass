import UIKit

/*var str = "Hello, playground"

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack:[String] = []
        var initialParentheses:[String: String] = [")":"(","]":"[","}":"{"]
        
        for c in s {
            if !initialParentheses.keys .contains(String(c)) {
                stack.append(String(c));
            } else if stack.count > 0 && initialParentheses[String(c)] != stack.removeLast() {
                return false
            }
        }
        
        if stack.count == 0 {
            return true;
        } else {
            return false
        }
    }
}

let solution = Solution.init()
let flag = solution.isValid("{(})")
print(flag)

class MyQueue {

    /** Initialize your data structure here. */
     var inputStack = [Int]()
     var outputStack = [Int]()
    init() {
    
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        self.inputStack.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        
        
        if self.outputStack.count > 0 {
            return self.outputStack.removeLast()
        } else {
            while self.inputStack.count > 0 {
                self.outputStack.append(self.inputStack.removeLast())
            }
            return self.outputStack.removeLast()
        }
    }
    
    /** Get the top element. */
    func peek() -> Int {
        
        if self.outputStack.count > 0 {
            return self.outputStack.last ?? 0
        } else {
            while self.inputStack.count > 0 {
                self.outputStack.append(self.inputStack.removeLast())
            }
            return self.outputStack.last ?? 0
        }
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        if self.outputStack.count > 0 {
            return false
        } else if (self.inputStack.count > 0) {
            return false
        } else {
            return true
        }
    }
}

let myQueue = MyQueue()
print(myQueue.empty())

myQueue.push(2)
print(myQueue.empty())
let peek = myQueue.peek()
print(peek)

let pop = myQueue.pop()
print(pop)
print(myQueue.empty())
*/

//class Solution {
//    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
//        if nums.count <= 0 {
//            return []
//        }
//
//        var window = [Int]()
//        var res = [Int]()
//
//        var index = 0
//        for x in nums {
//
//            if let windowFirst = window.first, index >= k && windowFirst <= index - k {
//                window.removeFirst()
//            }
//
//            while window.count > 0 &&  nums[window.last!] <= x {
//                window.popLast()
//            }
//            window.append(index)
//
//            if index >= k - 1 {
//                res.append(nums[window.first!])
//            }
//            index = index + 1
//        }
//        return res
//    }
//}

//class Solution1 {
//    func isAnagram(_ s: String, _ t: String) -> Bool {
//        var sMap = [Character:Int]()
//        var tMap = [Character:Int]()
//
//        for c in s {
//            if let cNum = sMap[c] {
//                sMap[c] = cNum + 1
//            } else {
//                sMap[c] = 1
//            }
//        }
//
//        for c in t {
//            if let cNum = tMap[c] {
//                tMap[c] = cNum + 1
//            } else {
//                tMap[c] = 1
//            }
//        }
//
//        return sMap == tMap
//    }
//}
//
//class Solution2 {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var map = [Int:Int]()
//        var index = 0
//        for i in nums {
//            let complement = target - nums[index]
//            if map.keys.contains(complement) {
//                return [map[complement]!,index]
//            }
//            map[i] = index
//            index = index + 1
//        }
//
//        return []
//    }
//}
//
//class Solution {
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        let sortedNums = nums.sorted {$0 < $1}
//        print("sortedNums = \(sortedNums)")
//        var res = [[Int]]()
//        var index = 0
//        for i in sortedNums {
//            //这点非常重要，下一个元素与上一个一样，跳过。
//            if index > 0 && sortedNums[index] == sortedNums[index - 1] {
//                index = index + 1
//                continue
//            }
//
//            if index >= sortedNums.count - 2 {
//                break
//            }
//
//            var left = index + 1
//            var right = sortedNums.count - 1
//            while left < right {
//                let sum = sortedNums[left] + sortedNums[right] + i
//                if sum < 0 {
//                    left = left + 1
//                } else if sum > 0  {
//                    right = right - 1
//                } else {
//                    res.append([i,sortedNums[left],sortedNums[right]])
//                    while left < right && sortedNums[left] == sortedNums[left + 1] {
//                        left = left + 1
//                    }
//
//                    while left < right && sortedNums[right] == sortedNums[right - 1] {
//                        right = right - 1
//                    }
//                    left = left + 1
//                    right = right - 1
//                }
//            }
//
//            index = index + 1
//        }
//
//        return res
//    }
//}
//
//var solution = Solution()
//let res = solution.threeSum([0,-4,-1,-4,-2,-3,2])
//print(res)

/**
 * Definition for a binary tree node.
 */
// public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.left = nil
//        self.right = nil
//    }
//}
//class Solution {
//    func isValidBST(_ root: TreeNode?) -> Bool {
//        return isValidBST(root, min: Int.min, max: Int.max);
//    }
//
//    func isValidBST(_ root: TreeNode?, min: Int, max: Int) -> Bool {
//        if let safeRoot = root {
//            if safeRoot.val <= min {return false}
//            if safeRoot.val >= max {return false}
//
//            return isValidBST(safeRoot.left, min: min, max: safeRoot.val) && isValidBST(safeRoot.right, min: safeRoot.val, max: max)
//        } else {
//            return true
//        }
//    }
//}

//class Solution1 {
//    func myPow(_ x: Double, _ n: Int) -> Double {
//        //terminator
//        if n == 0  {
//            return 1
//        }
//
//        //prepare data
//        if n < 0 {
//            return myPow(1 / x, -n)
//        }
//
//        if n % 2 == 1{
//            return x * myPow(x, n-1)
//        }
//
//        //divide and conquer, generate final result
//        return myPow(x * x, n / 2)
//    }
//}
//
//class Solution2 {
//    func myPow(_ x: Double, _ n: Int) -> Double {
//        var pow: Double = 1
//        var locX = x
//        var locN = n
//        if n < 0 {
//            locX = 1 / locX
//            locN = -locN
//        }
//
//        while locN != 0 {
//            if locN & 1 == 1 {
//                pow = locX * pow
//            }
//            locX = locX * locX
//            locN >>= 1
//        }
//
//        return pow
//    }
//}
//
//class Solution3 {
//    func majorityElement(_ nums: [Int]) -> Int {
//        let sortedNums = nums.sorted()
//        return sortedNums[sortedNums.count/2]
//    }
//}
//
//
//class Solution4 {
//    func majorityElement(_ nums: [Int]) -> Int {
//        return majorityElementInRect(nums, low: 0, high: nums.count - 1)
//    }
//
//    func majorityElementInRect(_ nums: [Int],low: Int, high: Int) -> Int {
//        if low == high {
//            return nums[low]
//        }
//
//        let mid = (high - low) / 2 + low
//        let left = majorityElementInRect(nums, low: low, high: mid)
//        let right = majorityElementInRect(nums, low: mid + 1, high: high)
//
//        if left == right {
//            return left
//        }
//
//        let countLeft = numsOfNum(nums, num: left, low: low, high: high)
//        let countRight = numsOfNum(nums, num: right, low: low, high: high)
//
//        if countLeft >= countRight {
//            return left
//        } else {
//            return right
//        }
//    }
//
//    func numsOfNum(_ nums: [Int], num: Int, low: Int, high: Int) -> Int {
//        var index = 0
//        var count = 0
//
//        while index <= high {
//            if nums[index] == num {
//                count = count + 1
//            }
//            index = index + 1
//        }
//
//        return count
//    }
//}

////BFS
//visited = set()
//def BFS(graph, start, end):
//
//    queue = []
//    queue.append([start])
//    visited.add(start)
//
//    while queue:
//        node = queue.pop()
//        visited.add(node)
//
//        process(node)
//        nodes = generateRelatedNodes(node)
//        queue.push(nodes)
//
//    //other process work
//
//
////DFS
//visited = set()
//def DFS(node,visited):
//    visited.add(node)
//
//    //processs node
//for next_node in node.children():
//    if not next_node in visited:
//        DFS(next_node,visited)
//
//
//visited = set()
//def DFS(self,tree):
//
//    if tree.root is Node:
//        return []
//
//    visited, stack = [], [tree.root]
//
//    while stack:
//        node = stack.pop()
//        visited.add(node)
//
//        //process node
//        process(node)
//        nodes = generatedRelatedNodes(node)
//        stack.push(nodes)
//
//    //other process work


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

//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init(_ val: Int) {
//        self.val = val
//            self.left = nil
//            self.right = nil
//        }
//}
//class Solution {
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        guard let safeRoot = root else {
//            return []
//        }
//
//        var queue = [TreeNode]()
//        queue.append(safeRoot)
//        //图的话需要存储访问过的节点var visited = []
//        var result = [[Int]]()
//
//        while queue.count > 0 {
//            var currentLevel = [Int]()
//
//            for _ in queue {
//                let node = queue.removeFirst()
//                currentLevel.append(node.val)
//                if node.left != nil {
//                    queue.append(node.left!)
//                }
//                if node.right != nil {
//                    queue.append(node.right!)
//                }
//            }
//
//            result.append(currentLevel)
//        }
//
//        return result;
//    }
//}
//
//class Solution2 {
//    var result = [[Int]]()
//
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        guard let safeNode = root else {
//            return []
//        }
//
//        self._dfs(safeNode, level: 0)
//        return result;
//    }
//
//    func _dfs(_ root: TreeNode?, level: Int) -> Void {
//        if root == nil {
//            return
//        }
//
//        if result.count < level + 1 {
//            result.append([])
//        }
//
//        result[level].append((root?.val)!)
//        self._dfs(root?.left, level: level + 1)
//        self._dfs(root?.right, level: level + 1)
//    }
//}


//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.left = nil
//        self.right = nil
//    }
//}
//
//class Solution {
//    func maxDepth(_ root: TreeNode?) -> Int {
//        if root == nil {
//            return 0
//        }
//        return 1 + max(maxDepth(root!.left),maxDepth(root!.right))
//    }
//}
//
//
//class Solution2 {
//    func minDepth(_ root: TreeNode?) -> Int {
//        if root == nil {
//            return 0
//        }
//
//        let left = minDepth(root!.left)
//        let right = minDepth(root!.right)
//
//        if left == 0 || right == 0 {
//            return left + right + 1
//        } else {
//            return 1 + min(left,right)
//        }
//    }
//}
//
//class Solution3 {
//    var result = [String]()
//
//    func generateParenthesis(_ n: Int) -> [String] {
//
//        _gen("", left: n, right: n)
//        return result
//    }
//
//    func _gen(_ sub: String, left: Int, right: Int) -> Void {
//        if left == 0 && right == 0 {
//            result.append(sub)
//            return
//        }
//
//        if left > 0 {
//            _gen(sub + "(", left: left - 1, right: right)
//        }
//
//        if right > left {
//            _gen(sub + ")", left: left, right: right - 1)
//        }
//    }
//}

//class Solution {
//    func mySqrt(_ x: Int) -> Int {
//        if x == 0 || x == 1 {
//            return x
//        }
//
//        var left = 0
//        var right = x
//        var res = 0
//        while left <= right {
//            let mid = (left + right) / 2
//            if mid == x / mid {
//                return mid
//            } else if mid < x / mid {
//                left = mid + 1
//                res = mid
//            } else {
//                right = mid - 1
//            }
//        }
//
//        return res
//    }
//}
//
//public class TrieNode {
//    var isEnd:Bool
//    var children:[Character:TrieNode]
//    public init () {
//        isEnd = false
//        children = [Character:TrieNode]()
//    }
//
//    func containKey(_ key: Character) -> Bool {
//        if children[key] == nil {
//            return false
//        } else {
//            return true
//        }
//    }
//    func getTrieNode(_ key: Character) -> TrieNode? {
//        return children[key];
//    }
//
//    func setTrieNode(_ key: Character, trieNode: TrieNode) -> Void {
//        children[key] = trieNode
//    }
//
//    func end() -> Bool {
//        return isEnd
//    }
//
//    func setEnd() -> Void {
//        isEnd = true
//    }
//}
//
//class Trie {
//
//    var root: TrieNode = TrieNode()
//
//    /** Initialize your data structure here. */
//    init() {
//    }
//
//    /** Inserts a word into the trie. */
//    func insert(_ word: String) {
//        var node = root
//        for c in word {
//            if !node.containKey(c) {
//                node.setTrieNode(c, trieNode: TrieNode())
//            }
//            node = node.getTrieNode(c)!
//        }
//
//        node.setEnd()
//    }
//
//    /** Returns if the word is in the trie. */
//    func search(_ word: String) -> Bool {
//
//        let node = searchPrefix(word)
//        if let safeNode = node, safeNode.end() {
//            return true
//        } else {
//            return false
//        }
//    }
//
//    func searchPrefix(_ word: String) -> TrieNode? {
//        var node: TrieNode = root
//        for c in word {
//            if node.containKey(c) {
//                node = node.getTrieNode(c)!
//            } else {
//                return nil
//            }
//        }
//
//        return node
//    }
//    /** Returns if there is any word in the trie that starts with the given prefix. */
//    func startsWith(_ prefix: String) -> Bool {
//        let node = searchPrefix(prefix)
//        if node != nil {
//            return true
//        } else {
//            return false
//        }
//    }
//
//
//}
//
//var trie = Trie()
//trie.insert("apple")
//let contain = trie.search("apple")
//print(contain)
/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */

//class Solution {
//    func countBits(_ num: Int) -> [Int] {
//        if num == 0 {
//            return [0]
//        }
//
//        var result = [Int]()
//
//        result.append(0)
//        result.append(1)
//
//        var index = 0
//        while index <= num {
//
//            if index >= 2 {
//                print(index)
//                result.append(result[index & (index - 1)] + 1)
//            }
//            index = index + 1
//        }
//
//        return result
//    }
//}
//
//let solution = Solution()
//var countBits = solution.countBits(2)
//print(countBits)
//
//countBits = solution.countBits(0)
//print(countBits)
//
//countBits = solution.countBits(4)
//print(countBits)

//class Solution2 {
//    func climbStairs(_ n: Int) -> Int {
//        if n == 0 || n == 1 || n == 2 {
//            return n
//        }
//
//        var stairs = [Int]()
//        stairs.append(1)
//        stairs.append(2)
//        for i in 2...n-1 {
//            stairs.append(stairs[i-1] + stairs[i-2])
//        }
//        return stairs[n-1]
//    }
//}
//
//var solution = Solution2()
//let counts = solution.climbStairs(5)
//print(counts)
//
//
//class Solution3 {
//    func minimumTotal(_ triangle: [[Int]]) -> Int {
//        if triangle.count == 1 {
//            return (triangle.first?.first)!
//        }
//
//        var result = Array<Int>.init(repeating: 0, count: triangle.count + 1)
//        for i in (0...(triangle.count - 1)).reversed() {
//            for j in 0...triangle[i].count - 1{
//                result[j] = triangle[i][j] + min(result[j], result[j+1])
//            }
//        }
//
//        return result[0]
//    }
//}
//
//var minimumTotalSolution = Solution3()
//let finalMinimum = minimumTotalSolution.minimumTotal([[2],
//                                                      [3,4],
//                                                      [6,5,7],
//                                                      [4,1,8,3]])
//print(finalMinimum)
//
//
//class Solution {
//    func lengthOfLIS(_ nums: [Int]) -> Int {
//        if nums.count < 2 {
//            return nums.count
//        }
//
//        var dp = Array<Int>.init(repeating: 1, count: nums.count)
//        var res = 0
//        for i in 1...(nums.count - 1) {
//            var maxInJ = 0
//            for j in 0...(i - 1) {
//                if nums[i] > nums[j] {
//                    maxInJ = max(maxInJ, dp[j])
//                }
//            }
//
//            dp[i] = maxInJ + 1
//            res = max(res, dp[i])
//        }
//
//        return res
//    }
//}
//
//var solution3 = Solution()
//var length = solution3.lengthOfLIS([10,9,2,5,3,7,101,18])
//print(length)
//
//length = solution3.lengthOfLIS([10])
//print(length)




