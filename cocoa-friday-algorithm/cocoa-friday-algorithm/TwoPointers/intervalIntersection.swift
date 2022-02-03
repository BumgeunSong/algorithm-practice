//
//  intervalIntersection.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/03.
//

import Foundation

func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
    
    var counts = firstList.reduce(into: [Int: Int]()) { count, interval in
        count[interval[0], default: 0] += 1
        count[interval[1], default: 0] -= 1
    }
    
    counts = secondList.reduce(into: counts) { count, interval in
        count[interval[0], default: 0] += 1
        count[interval[1], default: 0] -= 1
    }
    
    var result = [[Int]]()
    var overlap = 0
    
    for key in counts.keys.sorted() {
        if counts[key] == 0 { result.append([key, key]) }
        if overlap != 2 && overlap + counts[key]! >= 2 {
            result.append([key])
        }
        if overlap == 2 && overlap + counts[key]! < 2 {
            result.append(result.removeLast() + [key])
        }
        overlap += counts[key]!
    }
    return result
    
}
