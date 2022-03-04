//
//  UniquePaths.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/03/04.
//

import Foundation

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var memo = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    for i in 0..<m {
        for j in 0..<n {
            memo[i][j] = (i == 0 || j == 0) ? 1 : memo[i-1][j] + memo[i][j-1]
        }
    }
    return memo[m-1][n-1]
}
