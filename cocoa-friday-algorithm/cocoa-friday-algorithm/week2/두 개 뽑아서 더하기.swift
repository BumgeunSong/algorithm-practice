//
//  pick2Add.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/11.
//

import Foundation

func pick2Add(_ numbers:[Int]) -> [Int] {
    
    var sums: Set<Int> = []
    var pastIndex: Array<Int> = []
    
    for index1 in 0...numbers.count - 2 {
        if pastIndex.contains(numbers[index1]) {
            continue
        }
        
        for index2 in index1 + 1...numbers.count - 1 {
            sums.insert(numbers[index1] + numbers[index2])
        }
        
        pastIndex.append(numbers[index1])
    }
    let result = sums.sorted()
    return result
}
