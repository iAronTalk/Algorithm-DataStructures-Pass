import UIKit
/*
 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。

 示例:
 s = "abaccdeff"
 返回 "b"
 s = ""
 返回 " "

 限制：
 0 <= s 的长度 <= 50000
 */

//自己想出来的low B方法，dic记录是否重复，queue记录不重复的顺序
class Solution {
    func firstUniqChar(_ s: String) -> Character {
        let sArray = Array(s)
        var notUniq = [Character: Bool]()
        var quque = [Character]()
        for i in 0..<sArray.count {
            let char = sArray[i]
            if notUniq.keys.contains(char) {
                notUniq[char] = true
                if quque.contains(char) {
                    quque.remove(at: quque.firstIndex(of: char)!)
                }
            } else {
                if !quque.contains(char) {
                    quque.append(char)
                }
                notUniq[char] = false
            }
        }
        if !quque.isEmpty {
            return quque.first!
        }
        return Character(" ")
    }
}

//leetcode大神的办法，需要dic记录是否重复状态，但是需要两次for循环
class Solution2 {
    func firstUniqChar(_ s: String) -> Character {
        let sArray = Array(s)
        var notUniq = [Character: Bool]()
        var quque = [Character]()
        for i in 0..<sArray.count {
            let char = sArray[i]
            if notUniq.keys.contains(char) {
                notUniq[char] = true
            } else {
                notUniq[char] = false
            }
        }
        for char in sArray {
            if notUniq[char] == false {
                return char
            }
        }
        
        return Character(" ")
    }
}
