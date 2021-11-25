//
//  binaryTreeTraversal.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/25.
//




import Foundation

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


func preorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil { return [Int]() }
    return [root!.val] + preorderTraversal(root?.left) + preorderTraversal(root?.right)
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil { return [Int]() }
    return inorderTraversal(root?.left) + [root!.val] + inorderTraversal(root?.right)
}

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil { return [Int]() }
    return postorderTraversal(root?.left) + postorderTraversal(root?.right) + [root!.val]
}
