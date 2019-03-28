import UIKit

var str = "Hello, playground"

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack:[String] = []
        var initialParentheses:[String: String] = [")":"(","]":"[","}":"{"]
        
        for c in s {
            if !initialParentheses.keys .contains(String(c)) {
                stack.append(String(c));
            } else if stack.count > 0 && initialParentheses[String(c)] != stack.removeLast() {
                return false
            }
        }
        
        if stack.count == 0 {
            return true;
        } else {
            return false
        }
    }
}

let solution = Solution.init()
let flag = solution.isValid("{(})")
print(flag)

class MyQueue {

    /** Initialize your data structure here. */
     var inputStack = [Int]()
     var outputStack = [Int]()
    init() {
    
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        self.inputStack.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        
        
        if self.outputStack.count > 0 {
            return self.outputStack.removeLast()
        } else {
            while self.inputStack.count > 0 {
                self.outputStack.append(self.inputStack.removeLast())
            }
            return self.outputStack.removeLast()
        }
    }
    
    /** Get the top element. */
    func peek() -> Int {
        
        if self.outputStack.count > 0 {
            return self.outputStack.last ?? 0
        } else {
            while self.inputStack.count > 0 {
                self.outputStack.append(self.inputStack.removeLast())
            }
            return self.outputStack.last ?? 0
        }
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        if self.outputStack.count > 0 {
            return false
        } else if (self.inputStack.count > 0) {
            return false
        } else {
            return true
        }
    }
}

let myQueue = MyQueue()
print(myQueue.empty())

myQueue.push(2)
print(myQueue.empty())
let peek = myQueue.peek()
print(peek)

let pop = myQueue.pop()
print(pop)
print(myQueue.empty())
