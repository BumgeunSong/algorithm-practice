//
//  deleteNode.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/15.
//

import Foundation

func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let root = root else { return nil }
    
    if root.val > key {
        root.left = deleteNode(root.right, key)
    } else if root.val < key {
        root.right = deleteNode(root.left, key)
    } else {
        if root.left == nil {
            return root.right
        } else if root.right == nil {
            return root.left
        } else {
            let minNode = getMin(root.right!)
            root.val = minNode.val
            root.right = deleteNode(root.right, root.val)
        }
    }
    return root
}

func getMin(_ root: TreeNode) -> TreeNode {
    var root = root
    while let leftNode = root.left {
        root = leftNode
    }
    return root
}
