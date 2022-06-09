//
//  kthSmallest.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/08.
//

import Foundation

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    
    var stack = [TreeNode]()
    var root = root
    var index = 0
    
    while true {
        
        // 맨 왼쪽까지 이동함.
        while root != nil {
            stack.append(root!)
            root = root!.left
        }
        
        // 하나 위로 올라감.
        root = stack.popLast()!
        index += 1
        
        // Pop한 횟수가 k와 같으면 해당 노드가 왼쪽에서 k번째 노드.
        if (k == index) { return root!.val }
        
        // 오른쪽으로 이동해서 왼쪽 노드가 있으면 찾고 아니면 다시 pop해서 올라옴.
        else { root = root?.right }
    }
}





func binarySearch(_ root: TreeNode?, _ k: Int) -> Int {
    if root == nil { return -1 }
    
    let leftCount = nodeCount(root?.left)
    
    if leftCount == k-1 {
        return root!.val
    } else if leftCount < k-1 {
        return binarySearch(root?.right, k-1-leftCount)
    } else {
        return binarySearch(root?.left, k)
    }
}

func nodeCount(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return nodeCount(root.left) + 1 + nodeCount(root.right)
}
