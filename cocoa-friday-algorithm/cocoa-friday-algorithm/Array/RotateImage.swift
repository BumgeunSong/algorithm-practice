//
//  RotateImage.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/20.
//

import Foundation

func rotate(_ matrix: inout [[Int]]) {
    matrix = matrix.reversed()
    for y in 0..<matrix.count {
        for x in 0..<y {
            let temp = matrix[y][x]
            matrix[y][x] = matrix[x][y]
            matrix[x][y] = temp
        }
    }
}
