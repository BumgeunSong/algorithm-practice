//
//  InvertBinaryTree.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/28.
//

import Foundation


func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil { return nil }
    return TreeNode(root!.val, invertTree(root!.right), invertTree(root!.left))
}
