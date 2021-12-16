//
//  MajorityElement.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/16.
//

import Foundation


func majorityElement(_ nums: [Int]) -> Int {
    var count = [Int:Int]()
    for num in nums {
        count[num] = (count[num] ?? 0) + 1
        if count[num]! > (nums.count / 2) { return num }
    }
    return nums[0]
}

func majorityElement2(_ nums: [Int]) -> Int {
    return nums.sorted()[nums.count/2]
}


func boyerMoore(_ nums: [Int]) -> Int {
    var count = 0
    var candidate = 0
    
    for num in nums {
        if count == 0 { candidate = num }
        count += num == candidate ? 1 : -1
    }
    return candidate
}
