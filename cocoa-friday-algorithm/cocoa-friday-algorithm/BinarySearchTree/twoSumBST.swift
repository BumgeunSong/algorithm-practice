//
//  twoSumBST.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/30.
//

import Foundation

func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
    let sortedArr = inOrder(root)
    var p1 = 0
    var p2 = sortedArr.count - 1
    
    while p1 < p2 {
        if sortedArr[p1] + sortedArr[p2] > k {
            p2 -= 1
        } else if sortedArr[p1] + sortedArr[p2] < k {
            p1 += 1
        } else {
            return true
        }
    }
    return false
}

func findTarget2(_ root: TreeNode?, _ k: Int) -> Bool {
    var initialSet = [Int]()
    return traverse(root, k, &initialSet)
}

func traverse(_ root: TreeNode?, _ k: Int, _ data: inout [Int]) -> Bool {
    if root == nil { return false }
    if data.contains(k - root!.val) {
        return true
    } else {
        data.append(root!.val)
    }
    return traverse(root?.left, k, &data) || traverse(root?.right, k, &data)
}
