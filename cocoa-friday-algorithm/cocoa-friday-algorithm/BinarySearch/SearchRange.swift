//
//  SearchRange.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/28.
//

import Foundation
//
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    var low = 0
    var high = nums.count - 1
    var range = [-1, -1]
    
    while low <= high {
        let mid = (low + high) / 2
        if nums[mid] == target {
            
            
            let lft = searchRange(Array(nums[mid+1..<nums.count]), target)
            let rgt = searchRange(Array(nums[0..<mid]), target)
            // no left target
            if lft == [-1, -1] && rgt == [-1, -1] {
                return [mid, mid]
            } else {
                
            }
            // no right target
            
            // no left-right target
            // all left-right target
        } else if nums[mid] > target {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return range
}

