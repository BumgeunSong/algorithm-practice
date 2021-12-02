//
//  firstBadVersion.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/02.
//

import Foundation

func isBadVersion(_ version: Int) -> Bool{ return true }

func firstBadVersion(_ n: Int) -> Int {
    var low = 0
    var high = n - 1
    
    while low <= high {
        let mid = (low + high) / 2
        if isBadVersion(mid) {
            if isBadVersion(mid - 1) {
                high = mid - 1
            } else {
                return mid
            }
        } else {
            low = mid + 1
        }
    }
    return -1
}
