//
//  FindKthLargest.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/04.
//

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    return quickSelect(nums, k)
}

func quickSelect(_ nums: [Int], _ k: Int) -> Int {
    let pivot = nums[Int.random(in: 0..<nums.count)]
    
    // 중복 숫자가 있는 경우 pivot과 같은 숫자가 여러개일 수 있음.
    let same = nums.filter { $0 == pivot }
    
    let less = nums.filter { $0 < pivot }
    let more = nums.filter { $0 > pivot }
    
    if more.count + 1 > k   {
        return quickSelect(more, k)
    } else if (more.count+1...more.count+same.count) ~= k {
        return pivot
    } else {
        return quickSelect(less, k-(more.count+same.count))
    }
}
