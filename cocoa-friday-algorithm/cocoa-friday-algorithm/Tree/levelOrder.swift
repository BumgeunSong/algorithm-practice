//
//  levelOrder.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/27.
//

import Foundation


func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var answer: [[Int]] = []
    
    if root == nil {
        return answer
    }
    
    var currentQueue: [TreeNode] = [root!]
    
    while currentQueue.count > 0 {
        var nextQueue: [TreeNode] = []
        
        var levelValue: [Int] = []
        while currentQueue.count > 0 {
            let node = currentQueue.removeFirst()
            levelValue.append(node.val)
            if let leftChild = node.left { nextQueue.append(leftChild) }
            if let rightChild = node.right { nextQueue.append(rightChild) }
        }
        answer.append(levelValue)
        
        currentQueue = nextQueue
    }
    return answer
}
