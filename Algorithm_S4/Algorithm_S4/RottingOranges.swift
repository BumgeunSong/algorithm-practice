//
//  RottingOranges.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/05.
//

import Foundation

func orangesRotting(_ grid: [[Int]]) -> Int {
    
    var toVisitLevel = [[Pos]]()
    var levelCount = 0
    var grid = grid
    
    // 전체 grid에서 썩은 오렌지를 큐에 추가 & 방문 처리 (level 0)
    let root = searchGrid(grid, target: 2)
    root.forEach { grid[$0.x][$0.y] = 0 }
    toVisitLevel.append(root)
    
    while !toVisitLevel.isEmpty {
        let currentLv = toVisitLevel.removeFirst()
        var nextLv = [Pos]()
        
        for node in currentLv {
            for (dx, dy) in [(0,1),(0,-1),(1,0),(-1,0)] {
                let next: Pos = (node.x+dx, node.y+dy)
                
                // grid 벗어나는 방향 걸러냄
                guard (0..<grid.count) ~= next.x,
                        (0..<grid[0].count) ~= next.y else { continue }
                
                // 값이 0인 방향 걸러냄.
                if grid[next.x][next.y] == 0 { continue }
                
                // 다음 방문 level에 추가 및 방문 처리
                nextLv.append(next)
                grid[next.x][next.y] = 0
            }
        }
        
        if !nextLv.isEmpty {
            toVisitLevel.append(nextLv)
            levelCount += 1
        }
    }
    
    // grid에 1이 남아있는지 확인
    
    if searchGrid(grid, target: 1).isEmpty {
        return levelCount
    } else {
        return -1
    }
}


func searchGrid(_ grid: [[Int]], target: Int) -> [Pos] {
    var result = [Pos]()
    for i in grid.indices {
        for j in grid[0].indices where grid[i][j] == target {
            result.append((i,j))
        }
    }
    return result
}
