//
//  DistanceKeeping.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/05/01.
//

import Foundation

typealias coords = (x: Int, y: Int, distance: Int)

func checkAround(_ root: coords, place: [[Character]]) -> Bool {
    
    var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
    
    var toVisit = [root]
    visited[root.x][root.y] = true
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    while !toVisit.isEmpty {
        let current = toVisit.removeFirst()
        
        for i in dx.indices {
            let newX = current.x + dx[i], newY = current.y + dy[i]
            
            guard (0..<5) ~= newX && (0..<5) ~= newY else { continue }
            guard !visited[newX][newY] else { continue }
            guard current.distance < 2 else { continue }
            
            if place[newX][newY] == "P" { return false }
            
            if place[newX][newY] == "O" {
                visited[newX][newY] = true
                toVisit.append((newX, newY, current.distance + 1))
            }
        }
    }
    
    return true
}




func distanceKeeping(_ places: [[String]]) -> [Int] {
    let places = places.map { $0.map { Array($0) } }
    return places.map { place in checkPlaces(place) }
}

func checkPlaces(_ places: [[Character]]) -> Int {
    var result = 1
    for i in places.indices {
        for j in places.indices {
            if places[i][j] == "P" {
                if checkAround((i,j,0), place: places) == false {
                    result = 0
                }
            }
        }
    }
    return result
}
