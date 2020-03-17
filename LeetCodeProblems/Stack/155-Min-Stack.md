# 155. Min Stack - Easy
**最小栈**

设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。

push(x) -- 将元素 x 推入栈中。
pop() -- 删除栈顶的元素。
top() -- 获取栈顶元素。
getMin() -- 检索栈中的最小元素。

示例:
```
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> 返回 -3.
minStack.pop();
minStack.top();      --> 返回 0.
minStack.getMin();   --> 返回 -2.
```

备注：主要的操作在于push和pop，push时候仅在小于最小值进入最小数组，如果大，因为是栈结构一定先与最小值弹出。
pop操作，如果是最小值弹出，不是最小值最小值数组不做任何操作。
**CODINNG**

```
class MinStack {

    var data = [Int]()
    var min = [Int]()

    /** initialize your data structure here. */
    init() {

    }

    func push(_ x: Int) {

        if min.isEmpty || x <= getMin() {
            min.append(x)
        }
        data.append(x)
    }

    func pop() {

        if top() == getMin() {
            min.removeLast()
        }
        data.removeLast()
    }

    func top() -> Int {
        if !data.isEmpty {
            return data.last!
        }

        return 0
    }

    func getMin() -> Int {
        if !min.isEmpty {
            return min.last!
        }

        return 0
    }
}
```
