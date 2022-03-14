//
//  NumberofLongestIncreasingSubsequence.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/03/14.
//

import Foundation

func findNumberOfLIS(_ nums: [Int]) -> Int {
    var LIS = Array(repeating: 1, count: nums.count)
    var LISCount = Array(repeating: 0, count: nums.count)
    
    for i in (0..<nums.count).reversed() {
        
        for j in (i+1..<nums.count) {
            if nums[i] < nums[j] {
                LIS[i] = max(LIS[i], LIS[j]+1)
            }
        }
        var count = 0
        for j in (i..<nums.count) where LIS[j] == LIS[i]-1 {
            count += LISCount[j]
        }
        if count != 0 {
            LISCount[i] = count
        } else {
            for j in (i..<nums.count) where LIS[j] == LIS[i] {
                count += LISCount[j]
            }
            LISCount[i] = count
        }
        
        
    }
    print(LIS)
    print(LISCount)
    return LISCount.max()!
}
