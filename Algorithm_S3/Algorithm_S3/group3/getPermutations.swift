//
//  getPermutations.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/14.
//

import Foundation

func getPermutations(_ nums: [Int]) -> [[Int]] {
    if nums.isEmpty { return [] }
    if nums.count == 1 { return [nums] }
    
    return nums.indices.reduce([[Int]]()) { partialResult, i in
        let pick = nums[i]
        let remain = nums.filter { $0 != pick }
        let subPermutation = getPermutations(remain).map { [pick] + $0 }
        return partialResult + subPermutation
    }
}

func getSubsets(_ nums: [Int]) -> [[Int]] {
    if nums.isEmpty { return [[]] }
    if nums.count == 1 { return [[], nums]}
    
    let pick = nums[0]
    let remain = Array(nums.dropFirst())
    let subcombo = getSubsets(remain)
    return subcombo + subcombo.map({ [pick] + $0 })
}
