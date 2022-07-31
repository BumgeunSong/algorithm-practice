//
//  RunningSum.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/30.
//

import Foundation

func runningSum(_ nums: [Int]) -> [Int] {
    var nums = nums
    
    for i in nums.indices where i != 0 {
        nums[i] += nums[i-1]
    }
    return nums
}
