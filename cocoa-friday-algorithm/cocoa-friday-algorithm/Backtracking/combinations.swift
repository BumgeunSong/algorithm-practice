//
//  combinations.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/12.
//

import Foundation

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    if k == 0 { return [[Int]]()}
    if k == 1 { return Array(1...n).map { [$0] } }
    
    var answer: [[Int]] = []
    
    for prefix in 2...n+1 {
        print("prefix", prefix)
        let rest = combine(prefix - 1, k - 1)
        print("rest", rest)
        answer += rest.map { [prefix] + $0 }
    }
    return answer
}
