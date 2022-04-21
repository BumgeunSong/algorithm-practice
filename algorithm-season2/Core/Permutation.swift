//
//  Permutation.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/21.
//

import Foundation

func permute(_ nums: [Int]) -> [[Int]] {
    if nums.count == 1 { return [[nums[0]]] }
    
    return (0..<nums.count).reduce([[Int]]()) { partialResult, i in
        let fix = nums[i]
        let remain = nums.filter { $0 != fix }
        return partialResult + permute(remain).map { [fix] + $0}
    }
}

func permute2(_ nums: [Int]) -> [[Int]] {
    if nums.count == 1 { return [[nums[0]]] }
    
    let sortedNums = nums.sorted()
    
    return (0..<sortedNums.count).reduce([[Int]]()) { partialResult, i in
        if i > 0, sortedNums[i-1] == sortedNums[i] { return partialResult }
        let fix = sortedNums[i]
        let remain = sortedNums.enumerated().filter { $0.offset != i }.map { $0.element }
        let subPermute = permute2(remain).map { [fix] + $0 }
        return partialResult + subPermute
    }
}
