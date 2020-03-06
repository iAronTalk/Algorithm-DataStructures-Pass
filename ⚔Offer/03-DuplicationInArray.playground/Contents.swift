import UIKit

/*
 面试题57 - II. 和为s的连续正数序列
 
 输入一个正整数 target ，输出所有和为 target 的连续正整数序列（至少含有两个数）。

 序列内的数字由小到大排列，不同序列按照首个数字从小到大排列。

  

 示例 1：

 输入：target = 9
 输出：[[2,3,4],[4,5]]
 示例 2：

 输入：target = 15
 输出：[[1,2,3,4,5],[4,5,6],[7,8]]
  

 限制：

 1 <= target <= 10^5

 */

//解法：滑动窗口
//leetcode链接：https://leetcode-cn.com/problems/he-wei-sde-lian-xu-zheng-shu-xu-lie-lcof/
class Solution {
    func findContinuousSequence(_ target: Int) -> [[Int]] {
    var left = 1
    var right = 1
    var sum = 0
    
    var res = [[Int]]()
    while left <= target / 2 {
        if sum < target {
            sum += right
            right += 1
        } else if sum > target {
            sum -= left
            left += 1
        } else {
            var sumArray = [Int]()
            for i in left..<right {
                sumArray.append(i)
            }
            res.append(sumArray)
            sum -= left
            left += 1
        }
    }
    return res
}
