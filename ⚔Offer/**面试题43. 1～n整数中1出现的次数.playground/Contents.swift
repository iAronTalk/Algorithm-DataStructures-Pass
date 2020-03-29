import UIKit

/*
 输入一个整数 n ，求1～n这n个整数的十进制表示中1出现的次数。
 例如，输入12，1～12这些整数中包含1 的数字有1、10、11和12，1一共出现了5次。

 示例 1：

 输入：n = 12
 输出：5
 示例 2：

 输入：n = 13
 输出：6

 限制：
 1 <= n < 2^31
 注意：本题与主站 233 题相同：https://leetcode-cn.com/problems/number-of-digit-one/

 */

/*
 解题思路
 f(n))函数的意思是1～n这n个整数的十进制表示中1出现的次数，将n拆分为两部分，最高一位的数字high和其他位的数字last，分别判断情况后将结果相加，看例子更加简单。

 **高位为1的情况：例子如n=1234，high=1, pow=1000, last=234

 可以将数字范围分成两部分1~999和1000~1234

 1~999这个范围1的个数是f(pow-1)
 1000~1234这个范围1的个数需要分为两部分：
 千分位是1的个数：千分位为1的个数刚好就是234+1(last+1)，注意，这儿只看千分位，不看其他位
 其他位是1的个数：即是234中出现1的个数，为f(last)
 所以全部加起来是f(pow-1) + last + 1 + f(last);

 **高位不为去的情况：例子如3234，high=3, pow=1000, last=234

 可以将数字范围分成两部分1~999，1000~1999，2000~2999和3000~3234

 1~999这个范围1的个数是f(pow-1)
 1000~1999这个范围1的个数需要分为两部分：
 千分位是1的个数：千分位为1的个数刚好就是pow，注意，这儿只看千分位，不看其他位
 其他位是1的个数：即是999中出现1的个数，为f(pow-1)
 2000~2999这个范围1的个数是f(pow-1)
 3000~3234这个范围1的个数是f(last)
 所以全部加起来是pow + high*f(pow-1) + f(last);
 */

//最终题解参考了大神的代码，要不剑指offer的代码不知道清晰太多了。
class Solution {
    func countDigitOne(_ n: Int) -> Int {
        return helper(n)
    }
    
    func helper(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        let characters = String(n).map{$0}
        let high = Int(String(characters.first!))!
        let pows = Int(pow(Double(10.0),Double(characters.count - 1)))
        print(pows)
        let last = n - pows * high
        if high == 1 {
            return (helper(pows - 1) + last + 1 + helper(last))
        } else {
            return (high * helper(pows - 1) + pows + helper(last))
        }
    }
}

let s = Solution()
let r = s.countDigitOne(1333)

