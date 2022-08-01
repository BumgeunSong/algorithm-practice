//
//  Insert Interval.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/01.
//

import Foundation

func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var result = [[Int]]()
    
    var newInterval = newInterval
    for (i, interval) in intervals.enumerated() {
        if newInterval[1] < interval[0] {
            return result + [newInterval]
            + intervals[i..<intervals.count]
        } else if interval[1] < newInterval[0] {
            result.append(interval)
        } else {
            newInterval[0] = min(newInterval[0], interval[0])
            newInterval[1] = max(newInterval[1], interval[1])
        }
    }
    result.append(newInterval)
    return result
}
