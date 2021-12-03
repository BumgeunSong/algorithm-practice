//
//  sortedSquares.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/03.
//

import Foundation

func sortedSquares(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var answer = Array(repeating: 0, count: n)
    
    var start = 0
    var end = n - 1
    
    for i in (0...n-1).reversed() {
        if abs(nums[start]) < abs(nums[end]) {
            answer[i] = nums[start] * nums[start]
            start += 1
        } else {
            answer[i] = nums[end] * nums[end]
            end -= 1
        }
    }
    
    return answer
}
