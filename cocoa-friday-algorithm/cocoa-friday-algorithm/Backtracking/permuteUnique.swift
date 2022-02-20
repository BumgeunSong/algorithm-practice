//
//  permuteUnique.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/20.
//

import Foundation

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    if nums.count == 1 { return [nums] }
    
    var result = [[Int]]()
    
    let sortedNums = nums.sorted()
    
    for i in 0..<sortedNums.count {
        guard i == sortedNums.count-1 || sortedNums[i] != sortedNums[i+1] else { continue }
        
        let numsWithoutPick = sortedNums.enumerated()
            .filter { $0.offset != i }
            .map { $0.element }
        
        result += permuteUnique(numsWithoutPick).map({ [sortedNums[i]] + $0 })
    }
    
    return result
}
