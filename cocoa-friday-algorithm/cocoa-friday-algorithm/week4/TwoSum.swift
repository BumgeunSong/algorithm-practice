//
//  TwoSum.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/26.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let sorted = nums.enumerated()
        .map { [$0.offset, $0.element] }
        .sorted { $0[1] < $1[1] }
    
    var lowIndex = 0
    var highIndex = sorted.count - 1
    
    while lowIndex < highIndex {
        if sorted[lowIndex][1] + sorted[highIndex][1] < target {
            lowIndex += 1
        } else if sorted[lowIndex][1] + sorted[highIndex][1] > target {
            highIndex -= 1
        } else {
            break
        }
    }
    
    return [sorted[lowIndex][0], sorted[highIndex][0]]
}
