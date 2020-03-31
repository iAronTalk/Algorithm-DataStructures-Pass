import UIKit

/*
 输入一个正整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。
 示例 1:

 输入: [10,2]
 输出: "102"
 示例 2:

 输入: [3,30,34,5,9]
 输出: "3033459"
  
 提示:
 0 < nums.length <= 100
 说明:

 输出结果可能非常大，所以你需要返回一个字符串而不是整数
 拼接起来的数字可能会有前导 0，最后结果不需要去掉前导 0
 */
class Solution {
    //本题答案。
    func minNumber(_ nums: [Int]) -> String {
        if nums.count == 0 {
            return ""
        }
        
        var sorted = nums.map{"\($0)"}.sorted {return $0 + $1 < $1 + $0}
        return sorted.joined()
    }
    //与本体题意有出入的，拼接后可打乱
    func minNumber2(_ nums: [Int]) -> String {
        if nums.count == 0 {
            return ""
        }
        let sorted = nums.map{"\($0)"}
        var res = sorted.joined().sorted(by: <)
        for (index, num) in res.enumerated() {
            if res[0] == "0" && index != 0 && num != "0" {
                res.swapAt(0, index)
                break
            }
        }
        return String(res)
    }
}



let s = Solution()
let r = s.minNumber([9111, 1113, 56, 101, 204])
print(r)

