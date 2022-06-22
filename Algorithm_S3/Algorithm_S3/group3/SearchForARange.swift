//
//  SearchForARange.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/22.
//

import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.isEmpty { return [-1, -1] }
    if nums.count == 1 { return nums[0] == target ? [0,0] : [-1, -1] }
    return [searchLowerBound(nums, target), searchUpperBound(nums, target)]
}



func searchLowerBound(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count
    
    while low < high {
        let mid = (low + high) / 2
        
        if target <= nums[mid]  {
            high = mid
        } else {
            low = mid + 1
        }
    }
    
    // 모든 원소가 target보다 작을 때, lowerBound는 nums.count가 될 수 있음.
    if low == nums.count { return -1 }
    
    // lowerBound는 있지만, 실제 target은 배열에 존재하지 않을 수 있음.
    if nums[low] != target { return -1 }
    
    return low
}

func searchUpperBound(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count
    
    while low < high {
        let mid = (low + high) / 2
        
        if target >= nums[mid] {
            low = mid + 1
        } else {
            high = mid
        }
    }
    
    // 모든 원소가 target보다 클 때, upperBound는 0이 될 수 있음.
    if low == 0 { return -1 }
    
    // upperBound는 있지만, 실제 target은 배열에 존재하지 않을 수 있음.
    if nums[low-1] != target { return -1 }
    
    // 마지막 포지션을 return해야하므로 -1을 해준다.
    return low-1
}
