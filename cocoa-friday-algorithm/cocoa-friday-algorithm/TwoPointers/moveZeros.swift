//
//  moveZeros.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/04.
//

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    var i = 0
    var zero = 0
    while i < nums.count {
        if nums[i] == 0 {
            nums.remove(at: i)
            zero += 1
        } else {
            i += 1
        }
    }
    for _ in 0..<zero {
        nums.append(0)
    }
}
