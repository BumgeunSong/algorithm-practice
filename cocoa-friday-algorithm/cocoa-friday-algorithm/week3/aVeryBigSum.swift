//
//  aVeryBigSum.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/19.
//

import Foundation

func aVeryBigSum(ar: [Int]) -> Int {
    return ar.reduce(0) {
        return $0 + $1
    }
}
