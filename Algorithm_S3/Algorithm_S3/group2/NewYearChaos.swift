//
//  NewYearChaos.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/28.
//

import Foundation

func minimumBribes(q: [Int]) -> Void {
    
    var bribe = 0
    for i in 0..<q.count {
        let originalPos = q[i]-1, currentPos = i
        
        if originalPos-currentPos > 2 {
            print("Too chaotic")
            return
        }
        
        if originalPos-currentPos < 0 {
            for candidate in q[min(0,originalPos-1)..<currentPos] {
                if candidate > originalPos { bribe += 1 }
            }
        }
    }
    print("\(bribe)")
}
