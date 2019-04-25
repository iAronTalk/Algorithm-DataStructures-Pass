# 136. Single Number - Easy
**只出现一次的数字**

给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

示例 1:

```
输入: [2,2,1]
输出: 1
```

**可能的解法**
- 使用额外空间，哈希表，key为出现的数字，value为其出现的次数，Coding中使用的方案。
- 不使用额外空间，排序，遍历排序后的数组，当前数和下一个数不一致，则返回当前数。
- 不使用额外空间，异或操作。交换律：a ^ b ^ c <=> a ^ c ^ b，任何数于0异或为任何数 0 ^ n => n，相同的数异或为0: n ^ n => 0。

**CODINNG**

```
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        for item in nums {
            if map.keys.contains(item) {
                map[item]! += 1
            } else {
                map[item] = 1
            }
        }

        for (key, value) in map {
            if value == 1 {
                return key
            }
        }

        return 0
    }
}
```
