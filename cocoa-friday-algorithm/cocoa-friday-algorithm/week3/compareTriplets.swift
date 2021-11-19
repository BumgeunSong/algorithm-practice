//
//  compareTriplets.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/19.
//

import Foundation
func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var score = [0, 0]
    for i in 0..<a.count {
        if a[i] > b[i] {
            score[0] += 1
        } else if a[i] < b[i] {
            score[1] += 1
        }
    }
    return score
}
