//
//  combinationSum.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/21.
//

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    if target < 1 { return [[Int]]() }
    
    var results = [[Int]]()
    let candidates = candidates.filter { $0 <= target }
    if candidates.count == 0 { return results }
    
    if candidates.contains(target) { results.append([target]) }
    
    for i in 0..<candidates.count {
        let pick = candidates[i]
        let remain = Array(candidates[i..<candidates.count])
        
        results += combinationSum(remain, target-pick).map { $0 + [pick] }
    }
    
    return results
}
