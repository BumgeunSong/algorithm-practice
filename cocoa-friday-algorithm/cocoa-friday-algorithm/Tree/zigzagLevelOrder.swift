//
//  zigzagLevelOrder.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/11.
//

import Foundation

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil { return [[Int]]() }
    
    var unvisitedQueue = [[root]]
    var leftToRight = true
    var result = [[Int]]()
    
    while !unvisitedQueue.isEmpty {
        let currentLevel = unvisitedQueue.removeFirst()
        guard !currentLevel.isEmpty else { return result }
        
        var nextLevel = [TreeNode?]()
        var currentLevelValues = [Int]()
        
        for node in leftToRight ? currentLevel : currentLevel.reversed() {
            currentLevelValues.append(node!.val)
            if leftToRight {
                if node?.left != nil { nextLevel.append(node!.left) }
                if node?.right != nil { nextLevel.append(node!.right) }
            } else {
                if node?.right != nil { nextLevel.insert(node!.right, at: 0) }
                if node?.left != nil { nextLevel.insert(node!.left, at: 0) }
            }
            
        }
        result.append(currentLevelValues)
        unvisitedQueue.append(nextLevel)
        leftToRight = !leftToRight
    }
    
    return result
}
