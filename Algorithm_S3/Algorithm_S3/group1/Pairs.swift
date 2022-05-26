//
//  Pairs.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/25.
//

import Foundation

func pairs(k: Int, arr: [Int]) -> Int {
    
    let sorted = arr.sorted()
    
    var start = 0
    var end = 1
    var count = 0
    
    while end < sorted.count {
        let diff = sorted[end] - sorted[start]
        if diff < k {
            end += 1
        } else if diff > k {
            start += 1
            if start == end { end += 1 }
        } else {
            count += 1
            end += 1
        }
    }
    return count
}
