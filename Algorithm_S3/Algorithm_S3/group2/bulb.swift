//
//  bulb.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/26.
//

import Foundation

public func bulb(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    
    var totalIndex = 0
    var totalElement = 0
    var count = 0
    for i in 0..<A.count {
        totalIndex += i+1
        totalElement += A[i]
        if totalIndex == totalElement { count += 1 }
    }
    return count
}


func getCombo(_ s: [Character]) -> [[Character]] {
    if s.count < 2 { return [s] }
    
    let fix = s[0]
    let remain = Array(s.dropFirst())
    let comboOfRemain = getCombo(remain)
    
    var newCombo = [[Character]]()
    for combo in comboOfRemain {
        if fix == "B" && combo[0] == "B" { continue }
        newCombo.append([fix] + combo)
    }
    if newCombo.isEmpty { return newCombo }
    
    let max = newCombo.map { $0.count }.max()!
    let maxCombo = newCombo.filter { $0.count == max }
    return maxCombo
}
