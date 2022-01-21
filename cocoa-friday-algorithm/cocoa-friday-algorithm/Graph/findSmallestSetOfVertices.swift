//
//  findSmallestSetOfVertices.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/21.
//

import Foundation

func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
    let allNodes = Set(0..<n)
    var reachable = Set<Int>()
    for edge in edges {
        reachable.insert(edge[1])
    }
    return Array(allNodes.subtracting(reachable))
}
