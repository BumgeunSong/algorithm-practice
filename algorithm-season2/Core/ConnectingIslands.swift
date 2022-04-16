//
//  ConnectingIslands.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/12.
//

import Foundation

func connectIslands(_ n: Int, _ costs: [[Int]]) -> Int {
    
    func findParent(_ parent: [Int], _ x: Int) -> Int {
        return parent[x] == x ? parent[x] : findParent(parent, parent[x])
    }
    
    func unionParent(_ parent: [Int], _ a: Int, _ b: Int) -> [Int] {
        let rootA = findParent(parent, a)
        let rootB = findParent(parent, b)

        if rootA < rootB {
            return parent.map { $0 == rootA ? rootB: $0 }
        } else {
            return parent.map { $0 == rootB ? rootA: $0 }
        }
    }
    
    func isParentSame(_ parent: [Int], _ a: Int, _ b: Int) -> Bool {
        return findParent(parent, a) == findParent(parent, b)
    }
    
    var parent = Array(0..<n)
    let sortedCosts = costs.sorted { $0[2] < $1[2] }

    return sortedCosts.reduce(0) { sum, cost in
        if !isParentSame(parent, cost[0], cost[1]) {
            parent = unionParent(parent, cost[0], cost[1])
            return sum + cost[2]
        } else {
            return sum
        }
    }
}
