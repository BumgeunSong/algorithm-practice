//
//  numSubarrayProductLessThanK.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/06.
//

import Foundation

func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    
    var p1 = 0
    var result = 0
    var products = 1
    
    for p2 in 0..<nums.count {
        products *= nums[p2]
        while products >= k && p1 <= p2 {
            products /= nums[p1]
            p1 += 1
        }
        result += (p2 - p1) + 1
    }
    
    return result
}
