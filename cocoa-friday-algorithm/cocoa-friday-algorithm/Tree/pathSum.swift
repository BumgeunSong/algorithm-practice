//
//  pathSum.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/28.
//

import Foundation

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    if root == nil { return false }
    if root!.left == nil && root!.right == nil { return root!.val == targetSum }
    return hasPathSum(root?.left, targetSum - root!.val) || hasPathSum(root?.right, targetSum - root!.val)
}
