# 127. Word Ladder - Medium
**单词接龙**

给定两个单词（beginWord 和 endWord）和一个字典，找到从 beginWord 到 endWord 的最短转换序列的长度。转换需遵循如下规则：

每次转换只能改变一个字母。
转换过程中的中间单词必须是字典中的单词。
说明:

如果不存在这样的转换序列，返回 0。
所有单词具有相同的长度。
所有单词只由小写字母组成。
字典中不存在重复的单词。
你可以假设 beginWord 和 endWord 是非空的，且二者不相同。

```
示例 1:

输入:
beginWord = "hit",
endWord = "cog",
wordList = ["hot","dot","dog","lot","log","cog"]

输出: 5

解释: 一个最短转换序列是 "hit" -> "hot" -> "dot" -> "dog" -> "cog",
     返回它的长度 5。
示例 2:

输入:
beginWord = "hit"
endWord = "cog"
wordList = ["hot","dot","dog","lot","log"]

输出: 0

解释: endWord "cog" 不在字典中，所以无法进行转换。
```

**可能解法**

- BFS

**CODINNG**

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
 *

 class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {

        if !wordList.contains(endWord) { return 0 } //如果目标顶点不在图中，直接返回0

        let wordListSet = Set(wordList) //替换掉题目中List结构，加速查找
        var visited = [String: Int]() //用来存储已访问的节点，并存储其在路径上的位置
        var queue = [String]()  //构建队列，实现广度优先遍历

        visited[beginWord] = 1
        queue.append(beginWord)

        let alphabet: [Character] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        while !queue.isEmpty {
            let word = queue.removeFirst()
            let level = visited[word]!

            var wordArray = Array(word) //核心思想就是遍历所有可能的情况，进行替换，本质倒也不难。
            //这个地方的操作，却有BFS的影子，可能拼装出来的任何一个单词都是该层的元素，只是我么需要的是wordlist中的。
            for i in 0..<wordArray.count {
                for item in alphabet {
                    if item == wordArray[i] {
                        continue
                    }

                    var tempWordArray = wordArray
                    tempWordArray[i] = item  //对于每一位字母，分别替换成另外25个字母
                    let newWord = String(tempWordArray)
                    if newWord == endWord {
                        return visited[word]! + 1  //如果已经抵达目标节点，返回当前路径长度+1
                    }

                    if wordListSet.contains(newWord) && !visited.keys.contains(newWord) {  //如果字典中存在邻接节点，且这个邻接节点还未被访问
                        visited[newWord] = level + 1  //标记这个邻接节点为已访问，记录其在路径上的位置
                        queue.append(newWord)  //加入队列，以供广度搜索
                    }
                }
            }
        }
        return 0
    }
}
```
