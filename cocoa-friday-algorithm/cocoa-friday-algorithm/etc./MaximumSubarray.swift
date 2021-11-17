//
//  MaximumSubarray.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/16.
//

import Foundation


func maxSubArray(_ nums: [Int]) -> Int {
    
    if nums.count == 1 {
        return nums.min()!
    }
    
    var m = 0
    var result = 0
    for i in 0..<nums.count {
        m = max(nums[i], nums[i] + m)
        result = max(result, m)
    }
    return result
}

