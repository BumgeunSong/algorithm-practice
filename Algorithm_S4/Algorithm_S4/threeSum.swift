//
//  threeSum.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/01.
//

import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    var result = Set<[Int]>()
    let sortedNums = nums.sorted()
    for (i, num) in sortedNums.enumerated() where i <= nums.count - 2 {
        let two = twoSum(Array(sortedNums[i+1..<nums.count]), target: -num)
        
        for two in two {
            result.insert([num] + two)
        }
    }
    return Array(result)
}

func twoSum(_ nums: [Int], target: Int) -> [[Int]] {
    if nums.count < 1 { return [] }
    
    var start = 0
    var end = nums.count-1
    
    var result = [[Int]]()
    while start < end {
        if nums[start] + nums[end] < target {
            start += 1
        } else if nums[start] + nums[end] > target {
            end -= 1
        } else {
            result.append([nums[start], nums[end]])
            start += 1
            end -= 1
        }
    }
    return result
}
