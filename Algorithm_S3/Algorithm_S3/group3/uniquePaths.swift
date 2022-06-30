//
//  uniquePaths.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/30.
//

import Foundation

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var memo = Array(repeating: Array(repeating: 1, count: n), count: m)
    
    for i in 1..<m {
        for j in 1..<n {
            memo[i][j] = memo[i-1][j] + memo[i][j-1]
        }
    }
    return memo[m-1][n-1]
}
