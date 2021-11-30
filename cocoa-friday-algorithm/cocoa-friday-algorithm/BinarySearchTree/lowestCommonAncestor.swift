//
//  lowestCommonAncestor.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/30.
//

import Foundation

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let rootVal = root?.val, let pVal = p?.val, let qVal = q?.val else {
        return nil
    }
    
    if pVal < rootVal && qVal < rootVal {
        return lowestCommonAncestor(root?.left, p, q)
    } else if pVal > rootVal && qVal > rootVal {
        return lowestCommonAncestor(root?.right, p, q)
    } else {
        return root
    }
}
