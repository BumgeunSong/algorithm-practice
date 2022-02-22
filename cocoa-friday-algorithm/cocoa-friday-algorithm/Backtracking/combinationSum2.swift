//
//  combinationSum2.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/22.
//

import Foundation

class Backtracking {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard !candidates.isEmpty else { return [] }
        var result = [[Int]]()
        backtracking(&result, [], candidates.sorted(), target, 0)
        return result
    }
    
    func backtracking(_ result: inout [[Int]],  _ combination: [Int], _ candidates: [Int], _ target: Int, _ startIndex: Int) {
        if target == 0 {
            result.append(combination)
            return
        }
        
        var combination = combination
        for i in startIndex..<candidates.count {
            guard target >= candidates[i] else { return }
            if i != startIndex, candidates[i] == candidates[i-1] { continue }
            combination.append(candidates[i])
            backtracking(&result, combination, candidates, target-candidates[i], i+1)
            combination.removeLast()
        }
    }
}


