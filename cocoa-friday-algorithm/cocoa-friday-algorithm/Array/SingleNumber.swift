//
//  SingleNumber.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/16.
//

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    let count = nums.reduce(into: [Int: Int]()) { count, num in
        count[num] = (count[num] ?? 0) + 1
    }
    for (key, value) in count {
        if value == 1 { return key }
    }
    return nums[0]
}
