//
//  Triangle.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/15.
//

import Foundation

func minimumTotal(_ triangle: [[Int]]) -> Int {
    if triangle.count == 1 { return triangle[0][0] }
    var sumArr = [triangle[0]]
    for row in 1..<triangle.count {
        var rowSum = [Int]()
        for col in 0..<triangle[row].count {
            if col == 0 {
                rowSum.append(triangle[row][col] + sumArr[row-1][col])
            } else if col == triangle[row].count - 1 {
                rowSum.append(triangle[row][col] + sumArr[row-1][col - 1])
            } else {
                let right = triangle[row][col] + sumArr[row-1][col]
                let left = triangle[row][col] + sumArr[row-1][col - 1]
                rowSum.append(min(left,right))
            }
        }
        sumArr.append(rowSum)
    }
    return sumArr.last!.min()!
}
