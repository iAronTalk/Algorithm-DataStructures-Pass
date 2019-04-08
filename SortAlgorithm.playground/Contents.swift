import UIKit

class Solution {
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
    
    func quickSort(_ array: [Int]) -> [Int] {
        if array.count == 0 {
            return []
        }
        
        let localArray = array
        let mid = array[array.count / 2];
        var left = [Int]()
        var right = [Int]()
        
        for num in localArray {
            if num >= mid {
                right.append(num)
            } else {
                left.append(num)
            }
        }
        
        return left + [mid] + right;
    }
}

let solution = Solution()
var originalArray = [10,45,3,523,32,1,0,5,89,323];
let bubbleSort = solution.bubbleSort(originalArray)
print(bubbleSort)

let quickSort = solution.quickSort(originalArray)
print(quickSort)
