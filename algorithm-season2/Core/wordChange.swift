//
//  wordChange.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/07.
//

import Foundation

func wordChange(_ begin: String, _ target: String, _ words: [String]) -> Int {
    // target이 없다면 아예 도착할 수 없으므로 0
    guard words.contains(target) else { return 0 }
    var minPath = 60
    
    func dfs(_ root: String, count: Int) {
        if count > minPath { return }
        
        let adjacents = words.filter { isAdjacent(root, $0) }
        if adjacents.contains(target) { minPath = min(minPath, count) }
        adjacents.forEach { word in
            dfs(word, count: count+1)
        }
    }
    
    dfs(begin, count: 1)
    return minPath
}

func isAdjacent(_ lfs: String, _ rhs: String) -> Bool {
    var diffCount = 0
    let lfs = Array(lfs)
    let rhs = Array(rhs)
    
    for i in 0..<lfs.count {
        diffCount += lfs[i] != rhs[i] ? 1 : 0
    }
    return diffCount == 1
}
