//
//  buildTree.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/07.
//

import Foundation


func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    if preorder.isEmpty { return nil }
    if preorder.count == 1 { return TreeNode(preorder[0]) }
    
    let root = preorder[0]
    
    // root 값을 제외하고 인 오더 배열을 양쪽으로 나눈다.
    let inorderIndex = inorder.firstIndex(of: root)!
    let leftInorder = Array(inorder[0..<inorderIndex])
    let rightInorder = Array(inorder[inorderIndex+1..<inorder.count])
    
    // 인오더 배열의 갯수를 기준으로 프리오더 배열의 나머지를 2개로 나눈다.
    let leftPreorder = Array(preorder[1..<leftInorder.count+1])
    let rightPreorder = Array(preorder[leftInorder.count+1..<preorder.count])
    
    let rootTree = TreeNode(root)
    rootTree.left = buildTree(leftPreorder, leftInorder)
    rootTree.right = buildTree(rightPreorder, rightInorder)
    return rootTree
}
