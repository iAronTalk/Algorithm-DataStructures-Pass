# 387. First Unique Character in a String - Easy

**字符串中的第一个唯一字符**
给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。

案例:
```s = "leetcode"
返回 0.

s = "loveleetcode",
返回 2.
```
注意事项：您可以假定该字符串只包含小写字母。

**可能解法**
- 使用桶，类似于桶排序的方式，进行字母出现次数的计数
- 简化hash表，表长度为字符数组的长度，每个位置存放的key：字符，value：当前位置，字符出现了多少次。如leetcode的hashmap如下
["l":1,
"e":1,
"e":2...],最后遍历字典，输入第一个value为1坐在的位置索引即可。
**CODINNG**

```
class Solution {
    func firstUniqChar(_ s: String) -> Int {

        var characterCount = [Character: Int]()

        var characterInitial = [Character: Int]()

        var index = 0
        for character in s {

            if characterCount.keys.contains(character) {
                characterCount[character]! += 1
            } else {
                characterCount[character] = 1
            }

            if !characterInitial.keys.contains(character) {
                characterInitial[character] = index
            }
            index += 1
        }

        for (key, value) in characterCount {
            if value > 1 {
                characterInitial.removeValue(forKey: key)
            }
        }

        let uniqIndex = characterInitial.values.min()
        if characterInitial.isEmpty {return -1} else {return uniqIndex!}
    }
}
```
