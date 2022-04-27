//
//  feature.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/27.
//

import Foundation

func feature(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progresses = progresses
    var speeds = speeds
    var deploys = [Int]()
    
    while !progresses.isEmpty {
        // Increment 1 day
        for i in 0..<progresses.count { progresses[i] += speeds[i] }
        
        var count = 0
        
        // Count Completed subsequent Tasks
        while let first = progresses.first, first >= 100 {
            progresses.removeFirst()
            speeds.removeFirst()
            count += 1
        }
        
        if count > 0 { deploys.append(count) }
    }
    
    return deploys
}
