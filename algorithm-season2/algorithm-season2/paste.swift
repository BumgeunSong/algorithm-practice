//
//  paste.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/02.
//

import Foundation

let door = [Int]()

let graph = [[Int]]()

func plus(lhs: Int, rhs: Int) -> Int {
    let digits = String(rhs).count
    return lhs * Int(pow(Double(lhs), Double(digits))) + rhs
}

func paste(_ root: Int, sum: Int, target: Int) -> Int {
    let sum = plus(lhs: sum, rhs: door[root])
    if root == target { return sum }
    
    let toVisit = graph[root]
    if toVisit.isEmpty { return 0 }
    
    return toVisit.reduce(0) { partialResult, node in
        return partialResult + paste(node, sum: sum, target: target)
    }
}
