//
//  increasingTriplet.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/03.
//

import Foundation

func increasingTriplet(_ nums: [Int]) -> Bool {
    var min1 = Int.max
    var min2 = Int.max
    
    for num in nums {
        if num > min2 {
            return true
        } else if num > min1 {
            min2 = min(num, min2)
        } else {
            min1 = min(num, min1)
        }
    }
    
    return false
}
