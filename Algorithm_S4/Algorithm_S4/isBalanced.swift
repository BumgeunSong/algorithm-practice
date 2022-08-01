//
//  isBalanced.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/31.
//

import Foundation

func isBalanced(_ root: TreeNode?) -> Bool {
    return countHeight(root) == nil ? false : true
}

func countHeight(_ root: TreeNode?) -> Int? {
    if root == nil { return 0 }
    
    guard let leftHeight = countHeight(root?.left), let rightHeight = countHeight(root?.right) else {
        return nil
    }
    
    if abs(leftHeight - rightHeight) > 1 {
        return nil
    } else {
        return max(leftHeight, rightHeight) + 1
    }
}
