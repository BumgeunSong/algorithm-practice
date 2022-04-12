//
//  ConnectingIslands.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/12.
//

import Foundation

func connectIslands(_ n: Int, _ costs: [[Int]]) -> Int {
    
    let costsAscending = costs.sorted { $0[2] < $1[2] }
    
    var parent = Array(0..<n)
    var costSum = 0
    for cost in costsAscending {
        if getParent(cost[0]) == getParent(cost[1]) { continue }
        costSum += cost[2]
        let newParent = min(parent[cost[0]], parent[cost[1]])
        parent[cost[0]] = newParent
        parent[cost[1]] = newParent
    }
    
    func getParent(_ num: Int) -> Int {
        if parent[num] == num { return num }
        return getParent(parent[num])
    }
    
    return costSum
}
