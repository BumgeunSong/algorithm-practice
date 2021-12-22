//
//  Search2DMatrix.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/22.
//

import Foundation

func searchMatrixIteration(_ matrix: [[Int]], _ target: Int) -> Bool {
    var x = matrix[0].count - 1
    var y = 0
    while x >= 0 && y < matrix.count {
        if target < matrix[y][x] {
            x -= 1
        } else if target > matrix[y][x] {
            y += 1
        } else {
            return true
        }
    }
    return false
}

func searchMatrixRecursion(_ matrix: [[Int]], _ target: Int) -> Bool {
    func recursion(_ x: Int, _ y: Int) -> Bool {
        if y >= matrix.count || x < 0 { return false }
        if matrix[y][x] < target { return recursion(x, y+1) }
        else if matrix[y][x] > target { return recursion(x-1, y) }
        else { return true }
    }
    return recursion(matrix[0].count - 1, 0)
}
