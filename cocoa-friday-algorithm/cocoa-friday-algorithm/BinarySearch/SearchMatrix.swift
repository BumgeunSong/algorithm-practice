//
//  SearchMatrix.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/30.
//

import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    if matrix.isEmpty || matrix[0].isEmpty { return false }
    
    let pick = matrix[0][matrix[0].count-1]
    
    if target == pick {
        return true
    } else if target < pick {
        return searchMatrix(matrix.map({ $0.dropLast()}), target)
    } else {
        return searchMatrix(Array(matrix.dropFirst()), target)
    }
}
