//
//  updateMatrix.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/01.
//

import Foundation

func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
    var toVisit = [Pos]()
    var result = mat
    
    for i in mat.indices {
        for j in mat[0].indices {
            if result[i][j] == 0 {
                toVisit.append((i,j))
            } else {
                result[i][j] = Int.max
            }
        }
    }
    
    while !toVisit.isEmpty {
        let node = toVisit.removeFirst()
        
        for (dy, dx) in [(0,1), (0,-1), (1,0), (-1,0)] {
            let (newX, newY) = (node.x+dx, node.y+dy)
            
            guard (0..<mat.count) ~= newX,
                  (0..<mat[0].count) ~= newY else {
                continue
            }
            
            if result[newX][newY] <= result[node.x][node.y] + 1 {
                continue
            }
            
            result[newX][newY] = result[node.x][node.y] + 1
            toVisit.append((newX, newY))
        }
    }
    
    return result
}

typealias Pos = (x: Int, y: Int)
