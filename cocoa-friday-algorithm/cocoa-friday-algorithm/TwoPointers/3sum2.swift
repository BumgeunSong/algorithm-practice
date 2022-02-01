//
//  3sum.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/01.
//

import Foundation

func threeSum3(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 { return [[Int]]() }
    
    var result: Set<[Int]> = []
    let sortedNums = nums.sorted()
    
    
    for (i, pick) in sortedNums.enumerated() {
        let numsAfterPick = sortedNums.suffix(from: i+1)
        
        let twoSum = twoSum3(numsAfterPick, target: -pick)
        guard !twoSum.isEmpty else { continue }
        
        twoSum.forEach { result.insert( $0 + [pick] ) }
    }
    return Array(result)
}


func twoSum3(_ nums: [Int], target: Int) -> [[Int]] {
    var lo = 0
    var hi = nums.count-1

    var result = [[Int]]()
    while lo < hi {
        if nums[lo] + nums[hi] == target {
            result.append([nums[lo], nums[hi]])
            lo += 1
        } else if nums[lo] + nums[hi] < target {
            lo += 1
        } else {
            hi -= 1
        }
    }
    return result
}
