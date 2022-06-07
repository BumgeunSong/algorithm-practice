//
//  inorderTraversal.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/07.
//

import Foundation

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil { return [] }
    return inorderTraversal(root?.left) + [root!.val] + inorderTraversal(root?.right)
}
