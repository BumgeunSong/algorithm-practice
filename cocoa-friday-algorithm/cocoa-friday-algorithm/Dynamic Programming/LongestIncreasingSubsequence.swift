//
//  LongestIncreasingSubsequence.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/03/13.
//

import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
    var LIS = Array(repeating: 1, count: nums.count)
    for i in (0..<nums.count).reversed() {
        for j in (i+1..<nums.count) {
            if nums[i] < nums[j] {
                LIS[i] = max(LIS[i], LIS[j]+1)
            }
        }
    }
    return LIS.max()!
}
