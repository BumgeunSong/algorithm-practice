//
//  main.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation

print("Let's get algorithm tested")


let root = TreeNode(3, TreeNode(4, TreeNode(1), TreeNode(2)), TreeNode(5))
let subRoot = TreeNode(4, TreeNode(1), TreeNode(2))
print(isSubtree(root, subRoot))
