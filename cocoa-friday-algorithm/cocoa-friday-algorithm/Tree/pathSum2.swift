//
//  pathSum2.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/13.
//

import Foundation


func pathSum2(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    var result = [[Int]]()
    
    func DFS(_ root: TreeNode?, _ targetSum: Int, _ path: [Int]) {
        if root == nil { return }
        
        let currentPath = path + [root!.val]
        if root?.left == nil && root?.right == nil {
            if targetSum == currentPath.reduce(0, {$0 + $1}) { result.append(currentPath) }
            return
        }
        DFS(root?.left, targetSum, currentPath)
        DFS(root?.right, targetSum, currentPath)
    }
    DFS(root, targetSum, [])
    return result
}
