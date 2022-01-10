//
//  buildTree.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/10.
//

import Foundation

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    if preorder.isEmpty { return nil }
    if preorder.count == 1 { return TreeNode(preorder[0]) }
    
    let root = preorder[0], rootIndex = inorder.firstIndex(of: root)!
    
    let count = preorder.count
    let leftInorder = 0 < rootIndex ? Array(inorder[0..<rootIndex]) : []
    let rightInorder = rootIndex+1 < count ? Array(inorder[rootIndex+1..<count]) : []
    
    let leftcount = leftInorder.count
    let leftPreorder = 1 < leftcount+1 ? Array(preorder[1...leftcount]) : []
    let rightPreorder = leftcount + 1 < count ? Array(preorder[leftcount+1..<count]) : []
    
    return TreeNode(root, buildTree(leftPreorder, leftInorder), buildTree(rightPreorder, rightInorder))
}
