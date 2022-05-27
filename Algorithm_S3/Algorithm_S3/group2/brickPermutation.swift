//
//  brickPermutation.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/27.
//

import Foundation

func brickPermutation(n: Int, m: Int) -> Int {
    let totalCases: [Int] = (1...m).map { 가로 in
        totalCase(가로: 가로, 높이: n)
    }
    
    var solid = Array(repeating: 0, count: n-1)
    solid[1] = 1
    for i in 2...n {
        var total = totalCases[i]
        for j in 1...n-1 {
            total -= (solid[j] * totalCases[i-j])
        }
        solid[i] = total
    }
    
    
    return solid.last!
}

func permutation(nums: [Int], sum: Int) -> [[Int]] {
    if sum < 0 { return [] }
    if sum == 0 { return [[]] }
    if sum == 1 { return [[1]] }
    
    var results = [[Int]]()
    for num in nums {
        results += permutation(nums: nums, sum: sum-num).map { [num] + $0 }
    }
    return results
}

func totalCase(가로: Int) -> Int {
    permutation(nums: [1,2,3,4], sum: 가로).count
}

func totalCase(가로: Int, 높이: Int) -> Int {
    Int(pow(Double(totalCase(가로: 가로)), Double(높이)))
}


typealias Row = [Int]

func verticalPermutation(rows: [Row], n height: Int) -> [[Row]] {
    if height == 0 { return [[]] }
    
    var result = [[Row]]()
    for row in rows {
        result += verticalPermutation(rows: rows, n: height-1).map { [row] + $0 }
    }
    return result
}

func getPartialSum(row: Row) -> [Int:Int] {
    var total = 0
    var partialSum = [Int:Int]()
    for num in 1..<row.count-1 {
        total += num
        partialSum[total, default: 0] += 1
    }
    return partialSum
}

