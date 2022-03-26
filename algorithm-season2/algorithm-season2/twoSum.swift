//
//  twoSum.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/03/22.
//

import Foundation

extension Arrays {
    static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let sortedNums = nums.enumerated().map { (index, value) in
            return (index: index, value: value)
        }.sorted {
            return $0.value < $1.value
        }
        
        func recursiveCompare(_ nums: [(index: Int, value: Int)], _ start: Int, _ end: Int) -> [Int] {
            if start > end { return [0,0] }
            
            let sum = nums[start].value + nums[end].value
            
            if sum < target {
                return recursiveCompare(nums, start+1, end)
            } else if sum > target {
                return recursiveCompare(nums, start, end-1)
            } else {
                return [nums[start].index, nums[end].index]
            }
        }
        
        return recursiveCompare(sortedNums, 0, sortedNums.count-1)
    }
}
