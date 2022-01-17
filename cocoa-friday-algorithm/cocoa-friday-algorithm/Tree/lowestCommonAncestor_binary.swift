//
//  lowestCommonAncestor.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/17.
//

import Foundation

func lowestCommonAncestor2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    if root.val == p!.val || root.val == q!.val { return root }
    
    let left = lowestCommonAncestor2(root.left, p, q)
    let right = lowestCommonAncestor2(root.right, p, q)
    
    if left != nil && right != nil {
        return root
    } else if left != nil {
        return left
    } else if right != nil {
        return right
    } else {
        return nil
    }
}
