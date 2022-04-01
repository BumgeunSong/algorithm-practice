//
//  USADO.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/01.
//

import Foundation

func getNumberOfRelatedVideo(root: Int, k: Int, graph: [Int: [[Int]]]) -> Int {
    var visited = [[Int]]()
    var toVisited = [[root, 0]]
    var sumOfRelated = 0
    
    while !toVisited.isEmpty {
        let node = toVisited.removeFirst()
        let visitedNum = visited.map({ visitedNode in visitedNode[0] })
        
        
        visited.append(node)
        let currentUsado = node[1]
        
        guard let vertices = graph[node[0]] else { continue }
        let verticesTogo = vertices.filter { vertex in !visitedNum.contains(vertex[0])
        }.map { vertex -> [Int] in
            let newUsado = currentUsado == 0 ? vertex[1] : min(vertex[1], currentUsado)
            return [vertex[0], newUsado]
        }
        
        sumOfRelated += verticesTogo.filter { $0[1] >= k
        }.count
        
        toVisited += verticesTogo
    }
    return sumOfRelated
}

func read() {
    let lineArr = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let n = lineArr[0]
    let q = lineArr[1]

    var graph = [Int: [[Int]]]()
    
    for _ in 0..<n-1 {
        let lineArr = readLine()!.components(separatedBy: " ").map { Int($0)! }
        graph[lineArr[0], default: []] += [[lineArr[1], lineArr[2]]]
        graph[lineArr[1], default: []] += [[lineArr[0], lineArr[2]]]
    }
    
    var inputs = [[Int]]()
    for _ in 0..<q {
        let lineArr = readLine()!.components(separatedBy: " ").map { Int($0)! }
        inputs.append(lineArr)
    }
    
    for node in graph {
        print(node)
    }
    
    for input in inputs {
        let k = input[0]
        let v = input[1]
        
        print(getNumberOfRelatedVideo(root: v, k: k, graph: graph))
    }
    

}
