//
//  PopulatingNextRightPointers.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/10.
//

import Foundation

// [문제]
// Node에 next 포인터가 정의되어있다.
// next 포인터가 오른쪽 옆의 노드를 가리키도록 만들어라.
// 오른쪽 옆 노드가 없으면 nil 로 설정해라.
// 맨 처음에는 모든 next 포인터가 nil이다.

// [풀이]
// level-order traversal을 활용한다.
// 각 레벨을 돌 때마다, 레벨[index+1]을 next로 지정한다.
// index+1이 카운트보다 크면, nil로 지정한다.


func connect2(_ root: Node?) -> Node? {
    var unvisited = [[root]]
    
    while !unvisited.isEmpty {
        let currentLevel = unvisited.removeFirst()
        var nextLevel = [Node?]()
        for i in 0..<currentLevel.count {
            if i + 1 < currentLevel.count { currentLevel[i]?.next = currentLevel[i+1] }
            if let left = currentLevel[i]?.left { nextLevel.append(left) }
            if let right = currentLevel[i]?.right { nextLevel.append(right) }
        }
        if !nextLevel.isEmpty { unvisited.append(nextLevel) }
    }
    
    return root
}
