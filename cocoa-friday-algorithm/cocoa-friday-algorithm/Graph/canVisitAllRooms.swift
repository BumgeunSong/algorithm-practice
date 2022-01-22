//
//  canVisitAllRooms.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/22.
//

import Foundation

func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
    var visited = [0]
    func dfs(_ keys: [Int]) {
        if keys.isEmpty { return }
        for key in keys {
            if !visited.contains(key) {
                visited.append(key)
                dfs(rooms[key])
            }
        }
    }
    dfs(rooms[0])
    return visited.count == rooms.count
}
