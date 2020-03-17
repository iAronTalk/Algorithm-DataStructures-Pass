import UIKit

/*
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。
 示例 1：
 输入：s = "We are happy."
 输出："We%20are%20happy."
 
 限制：
 0 <= s 的长度 <= 10000
 链接：https://leetcode-cn.com/problems/ti-huan-kong-ge-lcof

 */
//此种办法跟题解思路是一致的，时间复杂度也相差不多。O(m + n)
 class Solution {
     func replaceSpace(_ s: String) -> String {
        var arrayString: [Character] = Array(s)
        var index = 0
        while index < arrayString.count {
            let char = arrayString[index]
            if char == " " {
                arrayString.remove(at: index)
                arrayString.insert(Character("0"), at: index)
                arrayString.insert(Character("2"), at: index)
                arrayString.insert(Character("%"), at: index)
                index += 3
            } else {
                index += 1
            }
        }
        return String(arrayString)
     }
 }

let s = Solution()
let r = s.replaceSpace("we are family")
print(r)

