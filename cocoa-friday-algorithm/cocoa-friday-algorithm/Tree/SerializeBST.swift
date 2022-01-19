//
//  SerializeBST.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/18.
//

import Foundation

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        if root == nil { return "" }
        func inorder(_ root: TreeNode?) -> [Int] {
            if root == nil { return [Int]() }
            return inorder(root?.left) + [root!.val] + inorder(root?.right)
        }
        
        func preorder(_ root: TreeNode?) -> [Int] {
            if root == nil { return [Int]() }
            return [root!.val] + preorder(root?.left) + preorder(root?.right)
        }
        
        return preorder(root).map({ "\($0)" }).joined(separator: ",") + "/" + inorder(root).map({ "\($0)" }).joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty { return nil }
        let dataArr = data.components(separatedBy: "/")
        let preorder = dataArr[0].components(separatedBy: ",").map {Int($0)!}
        let inorder = dataArr[1].components(separatedBy: ",").map {Int($0)!}

        guard preorder.count == inorder.count else { return nil }
        
        func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
            if preorder.isEmpty { return nil }
            
            if preorder.count == 1 { return TreeNode(preorder[0]) }
            
            let root = preorder.first!, rootIndex = inorder.firstIndex(of: root)!
            
            let count = preorder.count
            let leftInorder = 0 < rootIndex ? Array(inorder[0..<rootIndex]) : []
            let rightInorder = 1 < count ? Array(inorder[rootIndex+1..<count]) : []
            
            let leftcount = leftInorder.count
            
            let leftPreorder = 1 < leftcount+1 ? Array(preorder[1...leftcount]) : []
            let rightPreorder = leftcount+1 < count ? Array(preorder[leftcount+1..<count]) : []
            
            return TreeNode(root,
                            buildTree(leftPreorder, leftInorder),
                            buildTree(rightPreorder, rightInorder))
        }
        return buildTree(preorder, inorder)
    }
}
