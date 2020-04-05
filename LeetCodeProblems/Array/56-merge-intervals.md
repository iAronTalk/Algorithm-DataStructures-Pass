# 56. Merge Intervals - Medium
**合并区间**

给出一个区间的集合，请合并所有重叠的区间。

```
示例 1:

输入: [[1,3],[2,6],[8,10],[15,18]]
输出: [[1,6],[8,10],[15,18]]
解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
示例 2:

输入: [[1,4],[4,5]]
输出: [[1,5]]
解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
```
**可能解法**

- 双指针
- 排序后，合并，借鉴答案。

**CODINNG**
```
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count == 0 {
            return []
        } else if intervals.count == 1 {
            return intervals
        }
        var intervals = intervals
        intervals.sort(by: sortFunc(_:_:)) //先排序，区间left左边小的放在数组左边
        var merged = [[Int]]()
        for interval in intervals {
            if merged.isEmpty || merged.last!.last! < interval.first! {
                merged.append(interval)
            } else if merged.last!.last! < interval.last!{
                let last = merged.removeLast()
                merged.append([last.first!, interval.last!])
            }
        }
        return merged
    }
    func sortFunc(_ first: [Int], _ second: [Int]) -> Bool {
        return first.first! <= second.first!
    }
}
```
