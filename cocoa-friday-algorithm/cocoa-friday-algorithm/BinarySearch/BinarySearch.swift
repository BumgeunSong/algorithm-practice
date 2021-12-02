//
//  BinarySearch.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/02.
//

import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    
    var low = 0
    var high = nums.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return -1
}
