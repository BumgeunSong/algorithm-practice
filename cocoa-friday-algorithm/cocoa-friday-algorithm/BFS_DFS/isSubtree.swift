//
//  isSubtree.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/09.
//

import Foundation

func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
    func inorder(_ root: TreeNode?) -> [Int] {
        if root == nil { return [Int]() }
        return inorder(root?.left) + [root!.val] + inorder(root?.right)
    }
    
    let rootArr = inorder(root)
    let subRootArr = inorder(subRoot)
    
    var p1 = 0
    var p2 = 0
    
    while p1 < rootArr.count {
        if rootArr[p1] == subRootArr[p2] {
            p2 += 1
            p1 += 1
            if p2 >= subRootArr.count { return true }
        } else {
            p2 = 0
        }
    }
    return false
}
