# 栈和队列

## 1-如何仅仅用一个递归函数和栈操作逆序一个栈（2颗星）

> 明确题目

*IT名企-page7*

要求只能用栈和递归，在当前栈完成。

> 解答

- 将栈的栈底元素返回并删除
- 逆序一个栈

> CODINNG

```
class Solution {
    func getAndRemoveLasst(_ stack: inout [Int]) -> Int {

        let result = stack.removeLast()
        if stack.isEmpty {
            return result
        } else {
            let last = getAndRemoveLasst(&stack)
            stack.append(result)
            return last
        }
    }

    func reverse(_ stack: inout [Int]) -> Void {
        if stack.isEmpty {
            return
        }

        let i = getAndRemoveLasst(&stack)
        reverse(&stack)
        stack.append(i)
    }
}

let solution = Solution()
var stack = [1,2,3,4]
solution.reverse(&stack)
print(stack)
```

## 2-用一个栈实现另一个栈的排序（2颗星）

> 明确题目

*IT名企-page12*

> 解答

将要排序的栈记为stack，申请的辅助栈记为help。在stack上执行pop操作，弹出的元素记为cur。

- 如果cur小于或等于help的栈顶元素，直接压入help；

- 如果cur大于help的栈顶元素，那么把help中的元素逐个压入stack，直到栈顶元素小于等于help，把cur压入help。

> CODINNG

```
class Solution {
    func sortStackByStack(_ stack: inout [Int]?) -> Void {
        if stack == nil { return }
        if stack!.isEmpty { return }

        var help = [Int]()
        while !stack!.isEmpty {
            let cur = stack!.removeLast()
            if help.isEmpty || cur <= help.last! {
                help.append(cur)
                continue
            }

            while !help.isEmpty && cur > help.last! {
                stack!.append(help.removeLast())
            }

            help.append(cur)
        }

        while !help.isEmpty {
            stack!.append(help.removeLast())
        }
    }
}

let solution = Solution()
var stack: [Int]? = [3,23,31,14]
solution.sortStackByStack(&stack)
print(stack)

stack = nil
solution.sortStackByStack(&stack)
print(stack)
```
