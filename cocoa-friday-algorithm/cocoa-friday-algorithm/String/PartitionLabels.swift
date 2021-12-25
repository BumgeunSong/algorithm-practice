//
//  PartitionLabels.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/25.
//

import Foundation

func partitionLabels(_ s: String) -> [Int] {
    let allCount = s.reduce(into: [Character: Int]()) { partialResult, letter in
        partialResult[letter] = (partialResult[letter] ?? 0) + 1
    }
    
    var partitionCount = [Character: Int]()
    let strings = Array(s)
    
    var currentStart = 0
    var answer = [Int]()
    
    for i in 0..<s.count {
        partitionCount[strings[i]] = (partitionCount[strings[i]] ?? 0) + 1
        
        let same = partitionCount.keys.reduce(true) {
            $0 && (partitionCount[$1] == allCount[$1])
        }
        
        if same {
            answer.append(i + 1 - currentStart)
            currentStart = i + 1
            partitionCount = [Character: Int]()
        }
    }
    
    return answer
}



