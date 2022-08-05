//
//  searchRotatedArray.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/05.
//

import Foundation
import AppKit


func search(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var hi = nums.count-1
    
    while low <= hi {
        let mid = (low + hi) / 2
        if target == nums[mid] { return mid }
        
        // 2가지 경우의 수가 있음.
        // [회전 파트] + [회전 안된 파트]
        // mid가 회전이 된 부분에 있을 때 = mid가 low보다 큼.
        // mid가 회전이 안 된 부분에 있을 때 = mid가 hi보다 작음.
        
        
        if nums[mid] <= nums[hi] {
            
            // mid가 회전 파트에 있다면,
            // mid보다 더 큰 숫자이거나, 끝보다 작은 숫자는 오른쪽으로
            // mid보다 더 작은데, 끝보다 큰 숫자는 왼쪽으로
            
            if target < nums[mid] || target > nums[hi] {
                hi = mid-1
            } else {
                low = mid+1
            }
        } else if nums[mid] >= nums[low] {
            
            // mid가 회전 안된 파트에 있다면,
            // mid보다 더 작은 숫자이거나, 끝보다 큰 숫자는 왼쪽으로
            // mid보다 큰 숫자이고, 끝보다는 작은 숫자는 오른쪽으로
            
            if target > nums[mid] || target <= nums[hi] {
                low = mid+1
            } else if target < nums[mid] {
                hi = mid-1
            }
        }
    }
    
    return -1
}
