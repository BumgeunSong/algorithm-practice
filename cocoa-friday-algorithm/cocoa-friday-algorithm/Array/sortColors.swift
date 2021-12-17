//
//  sortColors.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/17.
//

import Foundation

func sortColors(_ nums: inout [Int]) {
    var red = 0, current = 0, blue = nums.count - 1
    
    while current <= blue {
        if nums[current] == 0 {
            nums.swapAt(current, red)
            current += 1
            red += 1
        } else if nums[current] == 2 {
            nums.swapAt(current, blue)
            blue -= 1
        } else {
            current += 1
        }
    }
}
