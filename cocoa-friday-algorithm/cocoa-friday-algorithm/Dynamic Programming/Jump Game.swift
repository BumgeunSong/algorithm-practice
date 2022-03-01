//
//  Jump Game.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/28.
//

import Foundation

func canJump(_ nums: [Int]) -> Bool {
    if nums.count == 1 { return true }
    
    var jumpableIndex = nums[0]
    
    for i in 0..<nums.count {
        if jumpableIndex < i { return false }
        jumpableIndex = max(jumpableIndex, i + nums[i])
    }
    
    return true
}
