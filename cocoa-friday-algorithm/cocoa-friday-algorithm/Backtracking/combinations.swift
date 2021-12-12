//
//  combinations.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/12.
//

import Foundation

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    if k == 1 {
        return Array(0...n).map { [$0] }
    }
    var answer: Set<[Int]> = []
    let rest = combine(n - 1, k - 1)
    for i in 1...n {
        var result: Set<[Int]> = []
        rest.forEach { rest in
            result.insert([i] + rest)
        }
        answer = answer.union(result)
    }
    return Array(answer)
}
