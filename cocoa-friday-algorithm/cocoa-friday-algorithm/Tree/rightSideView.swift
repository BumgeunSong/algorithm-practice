//
//  rightSideView.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/12.
//

import Foundation

func rightSideView(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    if root == nil { return result }
    
    var unvisitedLevel = [[root]]
    
    while !unvisitedLevel.isEmpty {
        let currentLevel = unvisitedLevel.removeFirst()
        var nextLevel = [TreeNode?]()
        
        for node in currentLevel {
            if node?.left != nil { nextLevel.append(node?.left) }
            if node?.right != nil { nextLevel.append(node?.right) }
        }
        result.append(currentLevel.last!!.val)
        
        if nextLevel.isEmpty { break }
        unvisitedLevel.append(nextLevel)
    }
    return result
}
