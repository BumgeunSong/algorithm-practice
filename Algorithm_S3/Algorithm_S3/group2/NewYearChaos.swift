//
//  NewYearChaos.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/28.
//

import Foundation

func minimumBribes(q: [Int]) -> Void {
    let q = q.map { $0-1 }
    
    var bribe = 0
    for (curIndex, originIndex) in q.enumerated() {
        
        if curIndex < originIndex-2 {
            print("Too chaotic")
            return
        }
        
        if curIndex > originIndex {
            bribe += countBribes(q: q, range: max(0,originIndex-1)..<curIndex)
        }
        
        
    }
    print("\(bribe)")
}

func countBribes(q: [Int], range: Range<Int>) -> Int {
    var count = 0
    
    for i in range {
        if q[i] > i { count += 1 }
    }
    
    return count
}
