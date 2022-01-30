//
//  searchRotatedArray.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/29.
//

import Foundation

func searchRotatedArray(_ nums: [Int], _ target: Int) -> Int {
    
    var leftEnd = 0
    var rightEnd = nums.count-1
    
    while leftEnd <= rightEnd {
        let mid = (leftEnd + rightEnd) / 2
        if nums[mid] == target { return mid }
        
        else if nums[mid] <= nums[rightEnd] {
            if nums[mid] < target && target <= nums[rightEnd] {
                leftEnd = mid+1
            } else {
                rightEnd = mid-1
            }
        } else if nums[leftEnd] <= nums[mid] {
            if nums[leftEnd] <= target && target < nums[mid] {
                rightEnd = mid-1
            } else {
                leftEnd = mid+1
            }
        }
    }
    return -1
}
