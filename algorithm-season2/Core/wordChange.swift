//
//  wordChange.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/07.
//

import Foundation

func wordChange(_ begin: String, _ target: String, _ words: [String]) -> Int {
    guard words.contains(target) else { return 0 }
    
    var toVisit = [begin]
    
    var isVisited = words.reduce(into: [String: Bool]()) { partialResult, word in
        partialResult[word] = false
    }
    
    
    
    var pathCount = 0
    
    while !toVisit.isEmpty {
        let node = toVisit.removeLast()
        
        let adjacent = words.filter({ isAdjascent(node, $0) })
        
        if adjacent.contains(target) { return pathCount }
        
        let newToVisit = adjacent.filter { !isVisited[$0]! }
        
        toVisit += newToVisit
        
        newToVisit.forEach { isVisited[$0] = true }
        
        pathCount += 1
    }
    
    return pathCount
}

func isAdjascent(_ lfs: String, _ rhs: String) -> Bool {
    var diffCount = 0
    let lfs = Array(lfs)
    let rhs = Array(rhs)
    
    for i in 0..<lfs.count {
        diffCount += lfs[i] != rhs[i] ? 1 : 0
    }
    return diffCount == 1
}
