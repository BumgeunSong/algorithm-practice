//
//  FindPeakElement.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/27.
//

import Foundation

func findPeakElement(_ nums: [Int]) -> Int {
    var low = 0
    var high = nums.count - 1
    
    while high - low > 1 {
        let mid = (low + high) / 2
        
        if nums[mid+1] < nums[mid], nums[mid] > nums[mid-1] {
            return mid
        } else if nums[mid] < nums[mid+1] {
            low = mid + 1
        } else {
            high = mid - 1
        }
     }
    
    if low == high {
        return low
    } else {
        return nums[low] > nums[high] ? low : high
    }
}
