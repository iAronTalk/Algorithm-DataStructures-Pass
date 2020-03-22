import UIKit

/*
 把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。例如，数组 [3,4,5,1,2] 为 [1,2,3,4,5] 的一个旋转，该数组的最小值为1。

 示例 1：
 输入：[3,4,5,1,2]
 输出：1
 示例 2：
 输入：[2,2,2,0,1]
 输出：0
 */

//这个算法比官方书籍中的形式上简单些，但是在最后一个else和返回值的理解是内含非常多逻辑。要自行体会，会参见作者：https://leetcode-cn.com/problems/xuan-zhuan-shu-zu-de-zui-xiao-shu-zi-lcof/solution/mian-shi-ti-11-xuan-zhuan-shu-zu-de-zui-xiao-shu-3/
//如果是参加面试，可以先记下，再自行理解。
class Solution {
    func minArray(_ numbers: [Int]) -> Int {
        var i = 0
        var j = numbers.count - 1
        while i < j {
            let middle = (i + j) / 2
            if numbers[middle] < numbers[j] {
                j = middle
            } else if numbers[middle] > numbers[j] {
                i = middle + 1
            } else {
                j -= 1
            }
        }
        return numbers[i]
    }
}
