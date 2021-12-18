//
//  MergeIntervals.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/18.
//

import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    var count = [Int:Int]()
    for interval in intervals {
        count[interval[0]] = (count[interval[0]] ?? 0) + 1
        count[interval[1]] = (count[interval[1]] ?? 0) - 1
    }
    var answer = [[Int]]()
    var counter = 0
    var interval = [0,0]
    for point in count.keys.sorted() {
        if counter == 0 {
            interval[0] = point
        }
        counter += count[point]!
        if counter == 0 {
            interval[1] = point
            answer.append(interval)
        }
    }
    return answer
}
