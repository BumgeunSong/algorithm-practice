//
//  kthSmallestBST.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/16.
//  https://leetcode.com/problems/kth-smallest-element-in-a-bst/

import Foundation

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [Int]() }
        return inorderTraversal(root?.left) + [root!.val] + inorderTraversal(root?.right)
    }
    return inorderTraversal(root)[k-1]
}
