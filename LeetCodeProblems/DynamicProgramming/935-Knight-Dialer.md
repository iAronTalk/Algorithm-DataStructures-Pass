# 935. Knight Dialer - Medium
**骑士拨号器**
国际象棋中的骑士移动：这一次，我们将 “骑士” 放在电话拨号盘的任意数字键（如上图所示）上，接下来，骑士将会跳 N-1 步。每一步必须是从一个数字键跳到另一个数字键。
每当它落在一个键上（包括骑士的初始位置），都会拨出键所对应的数字，总共按下 N 位数字。
你能用这种方式拨出多少个不同的号码？

因为答案可能很大，所以输出答案模 10^9 + 7。

```
示例 1：

输入：1
输出：10
示例 2：

输入：2
输出：20
示例 3：

输入：3
输出：46

提示：

1 <= N <= 5000
```

**可能解法**

- 递归。
- DP（递归 + 记忆）

**CODINNG**

```
class Solution {
    let mode = 1e9 + 7
    func _knightDiaaler(_ N: Int, _ k: Int, _ moves: [[Int]], _ memo: inout [[Int]]) -> Int {
        if N == 1 {
            return 1
        }
        //记忆中寻找 当前剩余步数，当前所在位置历史计算结果
        if memo[N][k] != -1 {
            return memo[N][k]
        }
        var tem = 0
        for step in moves[k] {
            tem = (tem + _knightDiaaler(N - 1, step, moves, &memo)) % Int(mode)
        }

        //保存：当前剩余步数，当前所在位置计算结果。
        memo[N][k] = tem
        return tem
    }

    func knightDialer(_ N: Int) -> Int {
        let moves = [[4,6],[6,8],[7,9],[4,8],[3,9,0],[],[1,7,0],[2,6],[1,3],[2,4]]
        var memo = [[Int]](repeating: [Int](repeating: -1, count: 10), count: N + 1)  //Swift二维数组初始化方式
        var res = 0
        for i in 0..<10 {
            res = (res + _knightDiaaler(N, i, moves, &memo)) % Int(mode)
        }

        return res
    }
}

```
