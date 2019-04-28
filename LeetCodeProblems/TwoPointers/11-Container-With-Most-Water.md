# 11. Container With Most Water - Medium
**盛最多水的容器**

给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

说明：你不能倾斜容器，且 n 的值至少为 2。

**可能解法**

- 暴力解法，双层循环，O(n^2)。
- 双指针，O(n)，本例使用解法

**CODINNG**

```
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        if height.count == 0 {
            return 0
        }

        var l = 0
        var r = height.count - 1

        var maxArea = 0
        while (l < r) {
            maxArea = max(maxArea,min(height[l], height[r]) * (r - l))

            if height[l] < height[r] {
                l += 1
            } else {
                r -= 1
            }
        }
        return maxArea
    }
}

```
