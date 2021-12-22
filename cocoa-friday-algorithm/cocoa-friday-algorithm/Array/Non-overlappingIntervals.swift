//
//  Non-overlappingIntervals.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/22.
//

import Foundation

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    var intervals = intervals.sorted { $0[0] < $1[0]
        
    }
    var i = 0, numOverlap = 0
    
    while i < intervals.count - 1 {
        let cur = intervals[i]
        let next = intervals[i + 1]
        
        if cur[1] > next[0] {
            if cur[1] > next[1] { intervals.remove(at: i) }
            else { intervals.remove(at: i + 1) }
            numOverlap += 1
        } else {
            i += 1
        }
    }
    
    return numOverlap
}
