//
//  HouseRobber.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/15.
//

import Foundation

func rob(_ nums: [Int]) -> Int {
    
    guard let first = nums.first else { return 0 }
    guard nums.count > 1 else { return first }
    
    var pointer = 2
    var solutions = [first, max(first, nums[1])]
    
    while pointer < nums.count {
        let nextUp = max(nums[pointer] + solutions[pointer - 2], solutions[pointer - 1])
        solutions.append(nextUp)
        pointer += 1
    }
    
    return solutions.last ?? 0
}
