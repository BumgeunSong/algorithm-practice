//
//  fizzBuzz.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/23.
//

import Foundation

func truckTour(petrolpumps: [[Int]]) -> Int {
    
    let diff = petrolpumps.map { $0[0] - $0[1] }
    let count = petrolpumps.count
    
    
    for start in 0..<count {
        var end = start
        var total = 0
        var length = 0
        
        while length < petrolpumps.count {
            total += diff[end]
            if total > 0 {
                end = end+1 < petrolpumps.count ? end+1 : end+1-petrolpumps.count
                length += 1
                
                if length >= petrolpumps.count { return start }
            } else {
                break
            }
        }
    }
    
    return 0
}
