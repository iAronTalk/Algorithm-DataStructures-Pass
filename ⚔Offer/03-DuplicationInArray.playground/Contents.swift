import UIKit

class Solution {
    func duplicateNum(_ nums: [Int]?, _ length: Int, _ duplicate: inout Int) -> Bool {
        guard let safeNums = nums else { return false }
        if length <= 0 {
            return false
        }
        var nums = safeNums
        for num in nums {
            if (num > length - 1) || (num < 0) {
                return false
            }
        }

        for i in 0..<nums.count {
            while nums[i] != i {
                if nums[i] == nums[nums[i]] {
                    duplicate = nums[i]
                    return true
                }
                let tmp: Int = nums[i]
                nums[i] = nums[tmp]
                nums[tmp] = tmp
            }
        }
        return false
    }
}

let s = Solution()
var dup = -1
//let success = s.duplicateNum([1,3,4,5,8,5,4,2,1,0], 9, &dup)
//et success = s.duplicateNum([1,3,4,9,8,5,7,2,6,0], 9, &dup)
let success = s.duplicateNum([1,3,3,9,8,5,7,2,6,12], 9, &dup)
print(dup)
print(success)
