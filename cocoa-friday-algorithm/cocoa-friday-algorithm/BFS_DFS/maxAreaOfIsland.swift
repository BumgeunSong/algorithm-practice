//
//  maxAreaOfIsland.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/09.
//

import Foundation

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var maxArea = 0
    var currentCount = 0
    var grid = grid
    
    for y in 0..<grid.count {
        for x in 0..<grid[0].count {
            dfs(&grid, x, y)
            maxArea = max(maxArea, currentCount)
            currentCount = 0
        }
    }
    
    func dfs(_ grid: inout [[Int]], _ x: Int, _ y: Int) {
        if grid[y][x] == 1 {
            grid[y][x] = 0
            currentCount += 1
            if y - 1 >= 0 { dfs(&grid, x, y - 1) }
            if x - 1 >= 0 { dfs(&grid, x - 1, y) }
            if y + 1 < grid.count { dfs(&grid, x, y + 1) }
            if x + 1 < grid[0].count { dfs(&grid, x + 1, y) }
        }
    }
    
    return maxArea
}


