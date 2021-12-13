//
//  ClimbingStairs.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/13.
//

import Foundation

func climbStairs(_ n: Int) -> Int {
    var memo: [Int] = Array(repeating: 0, count: n+1)
    for n in 1...n { memo[n] = n < 4 ? n : memo[n-1] + memo[n-2] }
    return memo.last!
}
