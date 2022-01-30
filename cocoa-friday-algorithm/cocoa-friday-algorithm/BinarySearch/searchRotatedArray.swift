//
//  searchRotatedArray.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/29.
//

import Foundation

func searchRotatedArray(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 { return -1 }
    if nums.count == 1 { return nums[0] == target ? 0 : -1 }
    if nums[0] < nums[nums.count-1] { return search(nums, target) }
    
    let k = findK(nums) + 1
    let original = Array(nums[k..<nums.count]) + Array(nums[0..<k])
    print(original)
    
    return search(original, target) == -1 ? -1 : (search(original, target) + k) % original.count
}

func findK(_ nums: [Int]) -> Int {
    
    if nums.count == 1 { return 0 }
    if nums.count == 2 { return nums[0] > nums[1] ? 0 : 1 }
    
    let mid = nums.count / 2
    if nums[mid] > nums[nums.count-1] {
        return findK(Array(nums[mid..<nums.count-1])) + mid
    } else  {
        return findK(Array(nums[0..<mid]))
    }
}
