//
//  minSubArrayLen.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/07.
//

import Foundation

func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    
    var p2 = 0
    var sum = 0
    var minLength = nums.count+1
    
    for p1 in 0..<nums.count {
        
        while p2 < nums.count && p1 <= p2 {
            print("p1:", p1, "p2:", p2, "p1-p2", nums[p1...p2], "sum", sum, "minLength", minLength)
            
            if sum + nums[p2] >= target {
                sum -= nums[p1]
                minLength = min(minLength, p2-p1+1)
                break
            } else {
                sum += nums[p2]
                p2 += 1
            }
        }
    }
    return minLength > nums.count ? 0 : minLength
}
