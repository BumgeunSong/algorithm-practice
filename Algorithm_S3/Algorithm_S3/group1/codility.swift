//
//  codility.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/26.
//

import Foundation

func findHole(_ A: inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    
    let sorted = A.sorted().filter { $0 > 0 }
    
    guard !sorted.isEmpty, sorted[0] == 1 else { return 1 }
    
    var prev = 1
    for index in 1..<sorted.count {
        if sorted[index] - prev > 1 {
            break
        }
        prev = sorted[index]
    }
    return prev + 1
}
