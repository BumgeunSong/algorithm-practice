//
//  findJudge.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/20.
//

import Foundation


func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
    if trust.isEmpty && n == 1 { return 1 }
    
    let reciverCount = trust.reduce(into: [Int: Int]()) { count, direction in
        count[direction[1]] = (count[direction[1]] ?? 0) + 1
    }
    
    let giverCount = trust.reduce(into: [Int: Int]()) { count, direction in
        count[direction[0]] = (count[direction[0]] ?? 0) + 1
    }
    
    let candidate = reciverCount.filter { (key, value) in
        value == n - 1
    }
    
    let finalCandidate = candidate.keys.filter { person in
        giverCount[person] == nil
    }
    
    return finalCandidate.isEmpty ? -1 : finalCandidate[0]
}
