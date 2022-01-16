//
//  BSTIterator.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/16.
//

import Foundation

class BSTIterator {

    var stack: [Int]
    
    init(_ root: TreeNode?) {
        func reverseInorder(_ root: TreeNode?) -> [Int] {
            if root == nil { return [Int]() }
            return reverseInorder(root?.right) + [root!.val] + reverseInorder(root?.left)
        }
        stack = reverseInorder(root)
    }
    
    func next() -> Int {
        return stack.removeLast()
    }
    
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
}
