import UIKit
/*
 输入一个字符串，打印出该字符串中字符的所有排列。
 你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。
 
 示例:
 输入：s = "abc"
 输出：["abc","acb","bac","bca","cab","cba"]
 
 限制：
 1 <= s 的长度 <= 8
 */

//这种做法与offer书给出来的不一样
//后面补齐offer书的办法。
class Solution {
    var res = [String]()
    func permutation(_ s: String) -> [String] {
        if s.count == 0 {
            return []
        }
        var visited = [Bool].init(repeating: false, count: s.count)
        def(s, "", &visited)
        return Array(Set(res))
    }
    
    func def(_ s: String, _ letters: String, _ visited: inout [Bool]) -> Void {
        if letters.count == s.count {
            res.append(letters)
            return
        }
        for (index, char) in s.enumerated() {
            if visited[index] {
                continue
            }
            visited[index] = true
            def(s, letters + String(char), &visited)
            visited[index] = false
        }
    }
}
