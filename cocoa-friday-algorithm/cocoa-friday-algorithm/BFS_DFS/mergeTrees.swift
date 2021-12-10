//
//  mergeTrees.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/10.
//

import Foundation

func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
    if root1 == nil && root2 == nil { return nil }
    if root1 == nil { return root2 }
    if root2 == nil { return root1 }
    return TreeNode(root1!.val + root2!.val, mergeTrees(root1?.left, root2?.left), mergeTrees(root1?.right, root2?.right))
}
