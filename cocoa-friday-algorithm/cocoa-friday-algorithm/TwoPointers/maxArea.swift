//
//  maxArea.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/04.
//

import Foundation

func maxArea(_ height: [Int]) -> Int {
    var l = 0, r = height.count-1
    
    var maxArea = 0
    
    while r - l > 0 {
        let currentArea = (r-l) * min(height[l],height[r])
        maxArea = max(currentArea, maxArea)
        if height[l] <= height[r] {
            l += 1
        } else {
            r -= 1
        }
    }
    
    return maxArea
}
