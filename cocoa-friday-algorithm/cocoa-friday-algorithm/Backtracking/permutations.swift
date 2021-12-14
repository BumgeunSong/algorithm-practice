//
//  permutations.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/14.
//

import Foundation

func permute(_ nums: [Int]) -> [[Int]] {
    if nums.count == 1 {
        return [nums]
    }
    
    var answer: [[Int]] = []
    for num in nums {
        let numsWithoutNum = nums.filter { $0 != num }
        permute(numsWithoutNum).forEach { answer.append($0 + [num]) }
    }
    
    return answer
}


func permute_reduce(_ nums: [Int]) -> [[Int]] {
    if nums.count == 1 {
        return [nums]
    }
    
    return nums.reduce(into: [[Int]]()) { partialResult, num in
        let numsWithoutNum = nums.filter { $0 != num }
        permute_reduce(numsWithoutNum).forEach { partialResult.append($0 + [num])
        }
    }
}


