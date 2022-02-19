//
//  subsetsWithDup.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/19.
//

import Foundation

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    if nums.isEmpty { return [[Int]()] }
    
    let prefix = nums[0]
    let remain = Array(nums.dropFirst())
    
    let subsetsOfRemain = subsetsWithDup(remain)
    let numOfPrefix = remain.filter({ $0 == prefix}).count
    return subsetsOfRemain
    + subsetsOfRemain.filter({ subset in
        subset.filter{ $0 == prefix }.count == numOfPrefix
    }).map({ [prefix] + $0 })
}
