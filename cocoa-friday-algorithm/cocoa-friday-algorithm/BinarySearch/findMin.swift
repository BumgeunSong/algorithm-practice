//
//  findMin.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/31.
//

import Foundation

func findMin(_ nums: [Int]) -> Int {
    var lo = 0, hi = nums.count-1
    
    while lo < hi {
        let mid = (lo + hi) / 2
        if nums[mid] > nums[hi] { lo = mid + 1 }
        else { hi = mid }
    }
    
    return nums[hi]
}
