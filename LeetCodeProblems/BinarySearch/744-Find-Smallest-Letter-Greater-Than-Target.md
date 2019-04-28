# 744. Find Smallest Letter Greater Than Target - Easy
**寻找比目标字母大的最小字母**
给定一个只包含小写字母的有序数组letters 和一个目标字母 target，寻找有序数组里面比目标字母大的最小字母。

数组里字母的顺序是循环的。举个例子，如果目标字母target = 'z' 并且有序数组为 letters = ['a', 'b']，则答案返回 'a'。

**可能解法**
- 二分，降低复杂度.

**CODINNG**

```
class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {

        var left = 0
        var right = letters.count - 1
        var middle = 0

        while left <= right {
            middle = (left + right) / 2
            if letters[middle] <= target {
                left = middle + 1
            } else if letters[middle] > target {
                right = middle - 1
            }
        }

        return left < letters.count ? letters[left] : letters[0]
    }
}
```
