//
//  3sum.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/16.
//

import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    var answer = Set<Array<Int>>()
    let nums = nums.sorted()
    
    
    for (i, num) in nums.enumerated() {
        var noNums = nums
        noNums.remove(at: i)
        var low = 0
        var high = noNums.count - 1
        
        while low < high {
            let target = -num
            if noNums[low] + noNums[high] < target {
                low += 1
            } else if noNums[low] + noNums[high] > target {
                high -= 1
            } else {
                answer.insert([num, noNums[low], noNums[high]].sorted())
                break
            }
        }
    }
    return Array(answer)
}

func threeSum2(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
      
        let nums = nums.sorted()
        var index = 0
        
        while index < (nums.count - 2) {
            
            var start = index + 1
            var end = nums.count - 1
            
            while start < end {
                let sum = nums[index] + nums[start] + nums[end]
                
                if sum == 0 {
                    result.append([nums[index], nums[start], nums[end]])
                }
                    
                if sum < 0 {
                    let currentStart = start
                    while start < end && nums[start] == nums[currentStart] {
                        start += 1
                    }
                } else {
                    let currentEnd = end
                    while start < end && nums[end] == nums[currentEnd] {
                        end -= 1
                    }
                }
            }
            
            let currentIndex = index
            while index < (nums.count - 2) && nums[index] == nums[currentIndex] {
                index += 1
            }
        }
        
        return result
    }
