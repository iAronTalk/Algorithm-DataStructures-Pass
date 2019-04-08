import UIKit

class Solution {
    //1.冒泡排序
    func bubbleSort(_ array: [Int]) -> [Int] {
        if array.count == 0 {
            return []
        }
        
        var localArray = array;
        let counts = localArray.count
        for i in 0..<counts {
            for j in 0..<(counts - i - 1) {
                if localArray[j + 1] < localArray[j] {
                    let temp = localArray[j + 1];
                    localArray[j + 1] = localArray[j]
                    localArray[j] = temp
                }
            }
        }
        return localArray;
    }
    
    //2.快速排序
    func quickSort(_ array: [Int]) -> [Int] {
        if array.count == 0 {
            return []
        }
        
        var localArray = array
        let mid = array[array.count / 2];
        localArray.remove(at: array.count / 2)
        
        var left = [Int]()
        var right = [Int]()
        for num in localArray {
            if num >= mid {
                right.append(num)
            } else {
                left.append(num)
            }
        }
        
        let temp = quickSort(left) + [mid]
        return temp + quickSort(right)
    }
    
    //3.插入排序
    func insertionSort(_ array: [Int]) -> [Int] {
        if array.count == 0 {
            return []
        }
        
        var localArray = array;
        for i in 0..<(localArray.count - 1) {
            let current = localArray[i + 1]
            var preIndex = i
            while preIndex >= 0 && current < localArray[preIndex] {
                localArray[preIndex + 1] = localArray[preIndex]
                preIndex = preIndex - 1
            }
            localArray[preIndex + 1] = current
        }
        
        return localArray
    }
    
    //4.希尔排序
    func shellSort(_ array: [Int]) -> [Int] {
        if array.count == 0 {
            return []
        }
        
        var localArray = array
        var increment = array.count / 2
        while increment > 0 {
            
            for i in increment..<array.count {
                var j = i
                while j - increment >= 0 && localArray[j] < localArray[j - increment] {
                    let temp = localArray[j - increment]
                    localArray[j - increment] = localArray[j]
                    localArray[j] = temp
                    j = j - increment
                }
            }
            increment = increment / 2
        }
        
        return localArray
    }
    
    //5.简单选择排序
    func selectionSort(_ array: [Int]) -> [Int] {
        if array.count == 0 {
            return []
        }
        
        var localArray = array
        
        for i in 0..<localArray.count {
            var minimumIndex = i
            for j in i..<localArray.count {
                if localArray[j] < localArray[minimumIndex] {
                    minimumIndex = j
                }
            }
            let temp = localArray[i]
            localArray[i] = localArray[minimumIndex]
            localArray[minimumIndex] = temp
            
        }
        return localArray
    }
    
    //6.堆排序
    func heapSort(_ array: [Int]) -> [Int] {
        
        func adjustHeap(_ array: inout [Int], i: Int, length: Int) -> Void {
            //构建大顶堆规则，如果左边小于右边，无需调整，指针移动，移动后的值如果大于根节点，与根节点互换，否则满足条件直接返回。
            //在构建大顶堆由从下到上，从右边到左，非叶子节点开始，调试从根节点开始调试。
            let temp = array[i]
            var ii = i
            var k = 2 * ii + 1
            while k < length {
                
                if k + 1 < length && array[k] < array[k + 1] {
                    k = k + 1
                }
                
                if array[k] > temp {
                    array[ii] = array[k]
                    ii = k
                } else {
                    break
                }
                k = 2 * k + 1
            }
            
            array[ii] = temp
            return
        }
        
        if array.count == 0 {
            return []
        }
        
        var localArray = array
        
        //构建大顶堆
        for i in (0..<localArray.count / 2 - 1).reversed() {
            adjustHeap(&localArray, i: i, length: localArray.count)
        }
        
        //互换堆头尾元素，调整大顶堆
        for j in (1..<localArray.count).reversed() {
            localArray.swapAt(0, j)
            adjustHeap(&localArray, i: 0, length: j)
        }
        
        return localArray
    }
    
    //7.归并排序
    func mergeSort(_ array: [Int]) -> [Int] {
        
        func merge(_ left: [Int], right: [Int]) -> [Int] {
            var index = 0, i = 0, j = 0
            var result = [Int]()
            
            while index < left.count + right.count {
                if i > left.count {
                    result.append(right[j])
                    j = j + 1
                } else if j > right.count {
                    result.append(left[i])
                    i = i + 1
                } else if left[i] < right[j] {
                    result.append(left[i])
                    i = i + 1
                } else {
                    result.append(right[j])
                    j = j + 1
                }
                
                index = index + 1
            }
            
            return result
        }
        
        if array.count == 0 {
            return []
        }
        
        var localArray = array
        
        let mid = localArray.count / 2
        let left = Array(localArray[0..<mid])
        let right = Array(localArray[mid..<localArray.count])
        return merge(mergeSort(left), right: mergeSort(right))
    }
}

let solution = Solution()
var originalArray = [10,45,3,523,32,1,0,5,89,323];

let bubbleSort = solution.bubbleSort(originalArray)
print(bubbleSort)

let quickSort = solution.quickSort(originalArray)
print(quickSort)

let insertionSort = solution.insertionSort(originalArray)
print(insertionSort)
//let insertionSort2 = solution.insertionSort([1,2,3,4])
//let insertionSort2 = solution.insertionSort([1])
//print(insertionSort2)

let shellSort = solution.shellSort(originalArray)
print(shellSort)

let selectionSort = solution.selectionSort(originalArray)
print(selectionSort)

let heapSort = solution.heapSort(originalArray)
print(heapSort)

let mergeSort = solution.mergeSort(originalArray)
print(mergeSort)


