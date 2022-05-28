//
//  gridChallenge.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/28.
//

import Foundation

func gridChallenge(grid: [String]) -> String {
    // Write your code here
    let sortedGrid = grid.map { row in
        return Array(row.sorted())
    }
    
    for col in 0..<grid[0].count {
        for row in 1..<grid[0].count {
            if sortedGrid[row-1][col] > sortedGrid[row][col] { return "NO" }
        }
    }
    return "YES"
}
