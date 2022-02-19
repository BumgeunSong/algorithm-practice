//
//  Subsets.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/19.
//

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
    if nums.isEmpty { return [[Int]()] }
    let subsetsOfRemain = subsets(Array(nums.dropFirst()))
    return subsetsOfRemain + subsetsOfRemain.map({ [nums[0]] + $0 })
}
