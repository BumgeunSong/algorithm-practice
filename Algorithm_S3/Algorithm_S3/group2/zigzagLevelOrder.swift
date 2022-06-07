//
//  zigzagLevelOrder.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/07.
//

import Foundation

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil { return [] }
    
    var toVisitLevel: [[TreeNode]] = [[root!]]
    var visitedLevel = [[Int]]()
    
    while !toVisitLevel.isEmpty {
        let currentLevel = toVisitLevel.removeFirst()
        var nextLevel = [TreeNode]()
        var visited = [Int]()
        
        for node in currentLevel {
            visited.append(node.val)
            if let left = node.left { nextLevel.append(left) }
            if let right = node.right { nextLevel.append(right) }
        }
        
        let zigzaged = visitedLevel.count % 2 == 0 ? visited : visited.reversed()
        visitedLevel.append(zigzaged)
        
        if nextLevel.isEmpty { break }
        toVisitLevel.append(nextLevel)
    }
    
    return visitedLevel
}
