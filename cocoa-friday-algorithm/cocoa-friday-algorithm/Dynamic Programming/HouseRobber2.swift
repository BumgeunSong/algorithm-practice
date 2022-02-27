//
//  HouseRobber2.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/27.
//

import Foundation

func rob2(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums[0] }
    return max(robbed(nums.dropFirst()), robbed(nums.dropLast()))
}

func robbed(_ nums: ArraySlice<Int>) -> Int {
    var rob1 = 0
    var rob2 = 0
    
    for n in nums {
        let newRob = max(rob1 + n, rob2)
        rob1 = rob2
        rob2 = newRob
    }
    return rob2
}
