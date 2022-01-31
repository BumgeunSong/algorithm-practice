//
//  findPeakElement.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/31.
//

import Foundation


func findPeakElement(_ nums: [Int]) -> Int {
    if nums.count == 1 { return 0 }
    
    var lo = 0, hi = nums.count-1
    
    while lo < hi {
        let mid = (lo + hi) / 2
        
        // 오른쪽이 크면, 왼쪽이 작든 크든 오른쪽으로 좁힘.
        if nums[mid] < nums[mid+1] {
            lo = mid + 1
        } else if mid == 0 || nums[mid-1] < nums[mid] {
            // 오른쪽이 작고, 왼쪽도 작거나 막혔을 때 peak
            return mid
        } else {
            // 오른쪽이 작고, 왼쪽이 크다면 왼쪽으로 좁힘.
            hi = mid
        }
    }
    return lo
}
