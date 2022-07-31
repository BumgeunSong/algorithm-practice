//
//  pivotIndex.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/30.
//

import Foundation

func pivotIndex(_ nums: [Int]) -> Int {
    var nums = nums
    
    for i in nums.indices where i != 0 {
        nums[i] += nums[i-1]
    }
    
    if nums[nums.count-1] - nums[0] == 0 { return 0 }
    
    for i in nums.indices where i != 0 {
        if nums[i-1] == nums[nums.count-1] - nums[i] { return i }
    }
    
    return -1
}
