//
//  numOfNetwork.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/07.
//

import Foundation

func numOfNetwork(_ n: Int, _ computers: [[Int]]) -> Int {
    var isVisited = Array(repeating: false, count: n)
    
    func bfs(_ root: Int) {
        var toVisit = [root]
        
        while !toVisit.isEmpty {
            let node = toVisit.removeFirst()
            let newToVisit = computers[node].enumerated().filter { (node, value) in
                (isVisited[node] == false) && (value == 1)
            }.map { node, value in
                return node
            }
                
            newToVisit.forEach { node in
                isVisited[node] = true
            }
            
            toVisit += newToVisit
        }
    }
    
    var numOfNetworks = 0
    for root in 0..<n where !isVisited[root] {
        bfs(root)
        numOfNetworks += 1
    }
    return numOfNetworks
}
