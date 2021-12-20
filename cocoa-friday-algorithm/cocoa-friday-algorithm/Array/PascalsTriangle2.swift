//
//  PascalsTriangle2.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/20.
//

import Foundation

func getRow(_ rowIndex: Int) -> [Int] {
    if rowIndex == 0 { return [1] }
    
    let upperRow = getRow(rowIndex - 1)
    let left = [0] + upperRow
    let right = upperRow + [0]
    
    var answer = [Int]()
    for i in 0..<left.count {
        answer.append(left[i] + right[i])
    }
    return answer
}
