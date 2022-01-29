//
//  SearchRange.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/28.
//

import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    let empty = [-1, -1]
    if nums.isEmpty { return empty }
    if nums.count == 1 { return nums[0] == target ? [0,0] : empty }
    
    let mid = nums.count / 2
    let lft = searchRange(Array(nums[0..<mid]), target)
    let rgt = searchRange(Array(nums[mid..<nums.count]), target)
    
    if lft == empty && rgt == empty {
        return empty
    } else if lft == empty {
        return [mid+rgt[0], mid+rgt[1]]
    } else if rgt == empty {
        return lft
    } else {
        return [lft[0], mid+rgt[1]]
    }
}

