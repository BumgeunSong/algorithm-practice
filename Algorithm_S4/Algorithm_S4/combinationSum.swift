//
//  combinationSum.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/05.
//

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    
    if target == 0 { return [[]] }
    if target < 0 { return [] }
    
    var result = [[Int]]()
    for (i, pick) in candidates.enumerated() {
        let remain = Array(candidates[i..<candidates.count])
        let comboRemain = combinationSum(remain, target - pick)
        result += comboRemain.map { [pick] + $0 }
    }
    
    return result
}
