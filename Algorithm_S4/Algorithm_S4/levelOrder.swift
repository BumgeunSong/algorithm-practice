//
//  levelOrder.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/02.
//

import Foundation

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil { return [] }
    
    var toVisitLevel = [[root]]
    var totalVisited = [[Int]]()
    
    while !toVisitLevel.isEmpty {
        let currentLv = toVisitLevel.removeFirst()
        var visited = [Int]()
        var nextLv = [TreeNode?]()
        
        for node in currentLv {
            if node != nil { visited.append(node!.val) }
            if node?.left != nil { nextLv.append(node?.left) }
            if node?.right != nil { nextLv.append(node?.right) }
        }
        
        if !nextLv.isEmpty { toVisitLevel.append(nextLv) }
        if !visited.isEmpty { totalVisited.append(visited) }
    }
    return totalVisited
}
