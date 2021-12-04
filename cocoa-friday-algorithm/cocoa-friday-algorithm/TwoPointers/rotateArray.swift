//
//  rotateArray.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/03.
//

import Foundation

func rotate(_ nums: inout [Int], _ k: Int) {
    let nk = nums.count-k
    
    for i in 0..<nk {
        nums.append(nums[i])
    }
    
    nums = Array(nums[nk...])
}
