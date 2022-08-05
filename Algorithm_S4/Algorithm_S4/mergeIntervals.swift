//
//  mergeIntervals.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/05.
//

import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    let points = intervals.reduce(into: [Int: Int]()) { partialResult, interval in
        partialResult[interval[0], default: 0] += 1
        partialResult[interval[1], default: 0] -= 1
    }
    
    var results = [[Int]]()
    var sum = 0
    var current = [0,0]
    
    for key in points.keys.sorted() {
        let newSum = sum + points[key]!
        
        if sum == 0 {
            current[0] = key
        }
        
        if newSum == 0 {
            current[1] = key
            results.append(current)
        }
        
        sum = newSum
    }
    
    return results
}
