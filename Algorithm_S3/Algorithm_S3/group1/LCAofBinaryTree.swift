//
//  LCAofBinaryTree.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/04.
//


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


import Foundation

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    if root.val == p!.val { return p }
    if root.val == q!.val { return q }
    
    let leftResult = lowestCommonAncestor(root.left, p, q)
    let rightResult = lowestCommonAncestor(root.right, p, q)
    
    switch (leftResult, rightResult) {
        // 양쪽에 없으면 내 서브 트리에는 없는 것이다.
    case (nil, nil): return nil
        // 오른쪽에 없으면 왼쪽 서브 트리에 LCA가 있다.
    case (_, nil): return leftResult
        // 왼쪽에 없으면 오른쪽 서브 트리에 LCA가 있다.
    case (nil, _): return rightResult
        // 오른쪽 왼쪽에 하나씩 있으면 자기 자신이 LCA다.
    case (_, _): return root
    }
}

func lowestCommonAncestorBST(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    // 베이스: root, p, q가 nil일 경우 nil 리턴
    guard let root = root, let q = q, let p = p else { return nil }
    
    // BST이므로, root가 만약 p,q 값보다 작다면 오른쪽 탐색.
    // BST이므로, root가 만약 p,q 값보다 크다면 왼쪽 탐색.
    // p, q와 같거나 그 사이에 있는 경우, 자기 자신 return.
    
    if root.val < min(p.val, q.val) { return lowestCommonAncestor(root.right, p, q) }
    if root.val > max(p.val, q.val) { return lowestCommonAncestor(root.left, p, q) }
    else { return root }
}

