//
//  isValidBST.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/30.
//

import Foundation

func isValidBST(_ root: TreeNode?) -> Bool {
    if root == nil { return true }
    return validate(root, high: Int.max, low: Int.min)
}

func validate(_ root: TreeNode?, high: Int, low: Int) -> Bool {
    if root == nil { return true }
    let isThisValid = root!.val > low && root!.val < high ? true : false
    let isLeftValid = validate(root?.left, high: root!.val, low: low)
    let isRightValid = validate(root?.right, high: high, low: root!.val)
    return isThisValid && isLeftValid && isRightValid
}


func isValidBST2(_ root: TreeNode?) -> Bool {
    let inOrder = inOrder(root)
    for i in 0..<inOrder.count - 1 {
        if inOrder[i] >= inOrder[i + 1] {
            return false
        }
    }
    return true
}

func inOrder(_ root: TreeNode?) -> [Int] {
    if root == nil { return [Int]() }
    return inOrder(root?.left) + [root!.val] + inOrder(root?.right)
}
