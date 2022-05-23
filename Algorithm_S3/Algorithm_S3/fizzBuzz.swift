//
//  fizzBuzz.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/23.
//

import Foundation

func truckTour(petrolpumps: [[Int]]) -> Int {
    
    let diff = petrolpumps.map { $0[0] - $0[1] }
    
    var start = 0
    
    while start < petrolpumps.count {
        var total = diff[start]
        var end = start
        
        while start != increment(end, length: petrolpumps.count) {
            total += diff[end]
            if total >= 0 {
                end = increment(end, length: petrolpumps.count)
            } else {
                break
            }
        }
        start += 1
    }
    
    return start
}

func increment(_ end: Int, length: Int) -> Int {
    return end+1 >= length ? end+1-length : end+1
}
