//
//  searchBST.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/29.
//

import Foundation

func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    if root == nil { return nil }
    if root!.val == val { return root! }
    return root!.val > val ? searchBST(root?.left, val) : searchBST(root?.right, val)
}
