//
//  ContainsDuplicate.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/03/17.
//

import Foundation

func containsDuplicate(_ nums: [Int]) -> Bool {
    let mapped = nums.map { ($0, 1) }
    let count = Dictionary(mapped, uniquingKeysWith: +)
        let duplicates = count.filter { key, value in
        value > 1
    }
    return !duplicates.isEmpty
}

func containsDuplicate2(_ nums: [Int]) -> Bool {
    return Set(nums).count != nums.count
}
