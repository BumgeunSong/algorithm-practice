//
//  numIslands.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/11.
//

import Foundation



func numIslands(_ grid: [[Character]]) -> Int {
    var islandCount = 0
    var grid = grid
    for i in grid.indices {
        for j in grid[0].indices where grid[i][j] == "1" {
            islandCount += 1
            removeIsland((i,j), &grid)
        }
    }
    return islandCount
}

func removeIsland(_ root: Position, _ grid: inout [[Character]]) {
    guard (0..<grid.count).contains(root.x) && (0..<grid[0].count).contains(root.y) else { return }
    guard grid[root.x][root.y] == "1" else { return }
    
    grid[root.x][root.y] = "0"
    
    let dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    for (dx, dy) in dxdy {
        let newPos: Position = (root.x + dx, root.y + dy)
        if (0..<grid.count).contains(newPos.x) && (0..<grid[0].count).contains(newPos.y) {
            removeIsland(newPos, &grid)
        }
    }
}
