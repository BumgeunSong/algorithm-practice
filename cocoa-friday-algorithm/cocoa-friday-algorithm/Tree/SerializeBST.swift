//
//  SerializeBST.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/18.
//

import Foundation

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        func inorder(_ root: TreeNode?) -> String {
            if root == nil { return "" }
            return inorder(root?.left) + "\(root!.val)" + inorder(root?.right)
        }
        
        func preorder(_ root: TreeNode?) -> String {
            if root == nil { return "" }
            return "\(root!.val)" + preorder(root?.left) + preorder(root?.right)
        }
        
        return preorder(root) + "," + inorder(root)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let dataArr = data.components(separatedBy: ",")
        let preorder = Array(dataArr[0]), inorder = Array(dataArr[1])
        guard preorder.count == inorder.count else { return nil }
        
        func buildTree(_ preorder: [Character], _ inorder: [Character]) -> TreeNode? {
            if preorder.isEmpty { return nil }
            
            if preorder.count == 1 { return TreeNode(preorder[0].wholeNumberValue!) }
            
            let root = preorder.first!, rootIndex = inorder.firstIndex(of: root)!
            
            let count = preorder.count
            let leftInorder = 0 < rootIndex ? Array(inorder[0..<rootIndex]) : []
            let rightInorder = 1 < count ? Array(inorder[rootIndex+1..<count]) : []
            
            let leftcount = leftInorder.count
            
            let leftPreorder = 1 < leftcount+1 ? Array(preorder[1...leftcount]) : []
            let rightPreorder = leftcount+1 < count ? Array(preorder[leftcount+1..<count]) : []
            
            return TreeNode(root.wholeNumberValue!,
                            buildTree(leftPreorder, leftInorder),
                            buildTree(rightPreorder, rightInorder))
        }
        return buildTree(preorder, inorder)
    }
}
