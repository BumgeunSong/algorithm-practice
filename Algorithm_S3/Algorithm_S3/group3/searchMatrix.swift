//
//  searchMatrix.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/23.
//

import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    
    // 오른쪽 위
    var mid = (x: 0, y: matrix[0].count-1)
    
    while mid.x < matrix.count, mid.y >= 0 {
        if matrix[mid.x][mid.y] < target {
            // 아래쪽으로
            mid.x += 1
        } else if matrix[mid.x][mid.y] > target {
            // 왼쪽으로
            mid.y -= 1
        } else {
            return true
        }
    }
    return false
}
