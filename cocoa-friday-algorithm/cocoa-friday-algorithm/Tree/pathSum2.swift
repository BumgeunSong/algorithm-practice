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
        if root?.left == nil && root?.right == nil {
            if targetSum == path.reduce(0, {$0 + $1}) { result.append(path) }
            return
        } else {
            
        }
        DFS(root?.left, targetSum, path + [root!.val])
        DFS(root?.right, targetSum, path + [root!.val])
        }
    }
    DFS(root, targetSum, [])
    
    return result
}
