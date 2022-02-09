//
//  isSubtree.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/09.
//

import Foundation

func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
    
    // root가 nil이면 부분트리가 없음.
    if root == nil { return false }
    
    // subRoot가 nil이면 부분트리에 반드시 들어감.
    if subRoot == nil { return true }
    
    // 둘다 nil이 아니면 같은지 확인
    if root?.val == subRoot?.val && isEqualTree(root, subRoot) {
        return true
    } else {
        // 아니면 하위 노드 비교
        return isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)
    }
}

func isEqualTree(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
    
    // 둘다 nil인 경우 -> True
    if a == nil && b == nil { return true }
    
    // 하나가 nil인 경우 -> false
    if a == nil || b == nil { return false }
    
    // 둘다 nil 아닌 경우
    // -> 서로 다르면 false
    if a?.val != b?.val { return false }
    
    // 서로 같으면 하위 노드 확인
    return isEqualTree(a?.left, b?.left) && isEqualTree(a?.right, b?.right)
}
