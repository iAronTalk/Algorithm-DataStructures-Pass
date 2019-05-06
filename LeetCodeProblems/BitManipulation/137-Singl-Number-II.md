# 137. Single Number II - Medium
**只出现一次的数字 II**
给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现了三次。找出那个只出现了一次的元素。

说明：
你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
```
示例 1:

输入: [2,2,3,2]
输出: 3
示例 2:

输入: [0,1,0,1,0,1,99]
输出: 99
```

**可能解法**

- 位运算
- 哈希表记录
- 数学算法，除重复后 * 3 - 原数组中之和 = 2 * 出现一次的数。

**相似题目**

- 136 Single Number

**CODINNG**

//首先我们会定义两个变量a和b，当遍历nums的时候，对于重复元素x，第一次碰到x的时候，我们会将x赋给a，第二次碰到后再赋给b，第三次碰到就全部消除。赋值和消除的动作可以通过xor很简单的实现。所以我们就可以写出这样的代码

```
a = (a^num)
b = (b^num)
```

但是上面写法忽略了，只有当a是x的时候，我们会将0赋给b，那要怎么做呢？我们知道如果b=0，那么b^num就变成了x，而x&~x就完成了消除操作，而此时a=x，所以第二行写为

`b = (b^num) & ~a`

同理，我们应该将第一行改为

`a = (a^num) & ~b`

*位运算*
```
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var a = 0, b = 0
        for item in nums {
            a = (a ^ item) & ~b
            b = (b ^ item) & ~a
        }

        return a
    }
}
```
*哈希表*
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
