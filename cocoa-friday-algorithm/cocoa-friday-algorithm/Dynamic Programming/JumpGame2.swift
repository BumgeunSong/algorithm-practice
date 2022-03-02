//
//  JumpGame2.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/03/01.
//  https://leetcode.com/problems/jump-game-ii/

import Foundation

func jump(_ nums: [Int]) -> Int {
    var jump = 0
    var end = 0
    var reach = 0
    
    for i in 0..<nums.count-1 {
        reach = max(reach, i + nums[i])
        if i == end {
            end = reach
            jump += 1
        }
    }
    
    return jump
}
