import UIKit

var greeting = "Hello, playground"

// Linear Search
/*
 Goal: Find a particular value in an array.

 We have an array of generic objects. With linear search, we iterate over all the objects in the array and compare each one to the object we're looking for. If the two objects are equal, we stop and return the current array index. If not, we continue to look for the next object as long as we have objects in the array.
 */
func linearSearch<T: Equatable>(_ array:[T], _ object: T) -> Int? {
    for (index, obj) in array.enumerated() where obj == object {
        return index
    }
    return nil
}

let array = [5, 2, 4, 7]
linearSearch(array, 2)

// Binary Search
/*
 * Note that the numbers array is sorted. The binary search algorithm does not work otherwise!
 */
func binarySearch<T: Comparable>(_ a:[T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        let midIndex = range.lowerBound + (range.upperBound - range.upperBound) / 2
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.lowerBound..<midIndex)
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex..<range.upperBound)
        } else {
            return midIndex
        }
    }
}

func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
    var lower = 0
    var upper = a.count
    while lower < upper {
        let midIndex = lower + (upper - lower) / 2
        if a[midIndex] < key {
            lower = midIndex + 1
        } else if a[midIndex] > key {
            upper = midIndex
        } else {
            return midIndex
        }
    }
    return nil
}

// Count Occurrences
/*
 Goal: Count how often a certain value appears in an array.

 The obvious way to do this is with a linear search from the beginning of the array until the end, keeping count of how often you come across the value. That is an O(n) algorithm.
 */

func countOccurrences<T: Comparable>(of key: T, in array:[T]) -> Int {
    var leftBound: Int {
        var lower = 0
        var upper = array.count
        while lower < upper {
            let midIndex = lower + (upper - lower) / 2
            if array[midIndex] < key {
                lower = midIndex + 1
            } else {
                upper = midIndex
            }
        }
        return lower
    }
    var rightBound: Int {
        var lower = 0
        var upper = array.count
        while lower < upper {
            let midIndex = lower + (upper - lower) / 2
            if array[midIndex] > key {
                upper = midIndex
            } else {
                lower = midIndex + 1
            }
        }
        return lower
    }
    
    return rightBound - leftBound
}

// Select Minimum / Maximum
// Goal: Find the minimum/maximum object in an unsorted array.
// 分别找最小值和最大值比较容易，忽略
// 同时找到最大和最小

func minimumMaximum<T: Comparable>(_ array: [T]) -> (minimum: T, maximum: T)? {
    guard var minimum = array.first else {
        return nil
    }
    
    var maximum = minimum
    let start = array.count % 2
    for i in stride(from: start, to: array.count, by: 2) {
        let pair = (array[i], array[i + 1])
        if pair.0 > pair.1 {
            if pair.0 > maximum {
                maximum = pair.0
            }
            if pair.1 < minimum {
                minimum = pair.1
            }
        } else {
            if pair.0 < minimum {
                minimum = pair.0
            }
            if pair.1 > maximum {
                maximum = pair.1
            }
        }
    }
    return (minimum, maximum)
}
let array2 = [ 8, 3, 9, 4, 6 ]
let array3: [Int] = []
print(minimumMaximum(array2) ?? (0, 0))
print(minimumMaximum(array3) ?? (0, 0))

// k-th Largest Element Problem
/*
 ou're given an integer array a. Write an algorithm that finds the k-th largest element in the array.

 For example, the 1-st largest element is the maximum value that occurs in the array. If the array has n elements, the n-th largest element is the minimum. The median is the n/2-th largest element.
 */

// we user Lomuto partitioning scheme to solve this
public func randomizedSelect<T: Comparable>(_ array: [T], order k: Int) -> T  {
    var array = array
    func randomPivot<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int) -> T {
//        let pivotIndex = (low...high).randomElement()
        let pivotIndex: Int? = 3
        a.swapAt(pivotIndex!, high)
        return a[high]
    }
    
    func randomizedPartition<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int) -> Int {
        let pivot = randomPivot(&a, low, high)
        var i = low
        for j in low..<high {
            if a[j] <= pivot {
                a.swapAt(i, j)
                i += 1
            }
        }
        a.swapAt(i, high)
        return i
    }
    
    func randomizedSelect<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int, _ k: Int) -> T {
        if low < high {
            let p = randomizedPartition(&a, low, high)
            if p == k {
                return a[p]
            } else if p < k {
                return randomizedSelect(&a, p + 1, high, k)
            } else {
                return randomizedSelect(&a, low, p - 1, k)
            }
        }
        return a[low]
    }
    
    precondition(array.count > 0)
    return randomizedSelect(&array, 0, array.count - 1, array.count - k)
}

//let array5 = [21, 4, 56, 2, 45, 21, 18, 19, 45]
//let arraySorted = array5.sorted()
//print(randomizedSelect(array5, order: 3))

