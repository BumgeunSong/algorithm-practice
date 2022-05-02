//
//  insertIntoBST.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    if root == nil { return TreeNode(val) }
    if root!.val > val {
        root!.left = insertIntoBST(root!.left, val)
        return root
    } else {
        root!.right = insertIntoBST(root!.right, val)
        return root
    }
}

