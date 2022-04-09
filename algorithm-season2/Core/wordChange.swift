//
//  wordChange.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/07.
//

import Foundation

func wordChange(_ begin: String, _ target: String, _ words: [String]) -> Int {
    guard words.contains(target) else { return 0 }
    
    dfs(begin, count: 0)
    
    let minPath = 60
    return minPath
}

func dfs(_ root: String, count: Int) {
    
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
