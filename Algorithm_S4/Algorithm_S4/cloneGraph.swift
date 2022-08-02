//
//  cloneGraph.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/02.
//

import Foundation

func cloneGraph(_ node: Node?) -> Node? {
    guard let node = node else { return nil }
    
    // 루트를 넣고 toVisit 초기화
    var toVisit: [Node] = [node]
    // visited 초기화 (+ 루트 처리)
    var visited = [Int: Node]()
    visited[node.val] = Node(node.val)
    
    while !toVisit.isEmpty {
        let currentNode = toVisit.removeLast()
        guard let currentClone = visited[currentNode.val] else { continue }
        
        // 현재 노드의 인접 노드를 순회
        for neighbor in currentNode.neighbors where neighbor != nil {
            // BFS 순회
            // 만약 인접 노드가 방문 안한 노드이면,
            // BFS Queue에 인접 노드를 추가.
            // Visited에 방문 체크 및 인접 노드 클론 생성
            if visited[neighbor!.val] == nil {
                toVisit.append(neighbor!)
                visited[neighbor!.val] = Node(neighbor!.val)
            }
            
            // Edge 복사 (인접 노드를 방문할 건지와 상관없이 현재 노드에 대한 복사는 해줘야 함)
            // 1. 인접 노드의 클론을 테이블에서 찾기
            // 2. 현재 노드 클론에 인접 노드 클론 Append 해주고 테이블에 저장.
            let neighborClone = visited[neighbor!.val]!
            currentClone.neighbors.append(neighborClone)
            visited[currentClone.val] = currentClone
            
        }
    }
    return visited[node.val]!
}
