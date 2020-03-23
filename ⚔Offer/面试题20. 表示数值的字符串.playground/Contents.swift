import UIKit

/*
 请实现一个函数用来判断字符串是否表示数值（包括整数和小数）。例如，字符串"+100"、"5e2"、"-123"、"3.1416"、"0123"及"-1E-16"都表示数值，但"12e"、"1a3.14"、"1.2.3"、"+-5"及"12e+5.4"都不是。
 注意：本题与主站 65 题相同：https://leetcode-cn.com/problems/valid-number/
 */

//接近崩溃，先放弃了。
class Solution {
    func isNumber(_ s: String) -> Bool {
        if s.count == 0 {
            return false
        }
        let permitedSet: Set<Character> = ["1","2","3","4","5","6","7","8","9","0","e","E","+","-","."]
        var findDot = false
        var findE = false
        var numberSeen = false
        var index = 0
        var s = s
        for char in s {
            if char == " " {
                s.remove(at: s.index(s.startIndex, offsetBy: index))
            } else if permitedSet.contains(char) {
                break
            } else {
                  index += 1
            }
        }
        index = s.count - 1
        for char in s.reversed() {
            if char == " " {
                s.remove(at: s.index(s.startIndex, offsetBy: index))
            } else if permitedSet.contains(char) {
                break
            } else {
                index -= 1
            }
        }
        index = 0
        print(s)
        for char in s {
            if "0" <= char && char <= "9" {
                numberSeen = true
            } else if char == "." {
                if (findDot || findE) {
                    print(1)
                    return false
                }
                findDot = true
            } else if (char == "e" || char == "E") {
                if (findE || !numberSeen) {
                    print(2)
                    return false
                }
                findE = true
                numberSeen = false
            } else if (char == "-" || char == "+") {
                if index != 0 &&
                    s[s.index(s.startIndex, offsetBy: index - 1)] != "E" &&
                    s[s.index(s.startIndex, offsetBy: index - 1)] != "e" {
                    print(3)
                    return false
                }
            } else {
                print(4)
                print("a" + String(char))
                return false
            }
            index += 1
        }
        return numberSeen
    }
}

let s = Solution()
let r = s.isNumber("1 ")
print(r)
