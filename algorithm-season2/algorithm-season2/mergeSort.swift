//
//  mergeSort.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/03/26.
//

import Foundation

struct Sorting {
    static func mergeSort(_ nums: [Int]) -> [Int] {
        if nums.isEmpty || nums.count == 1 { return nums }
        
        let middle = nums.count / 2
        
        let leftSorted = mergeSort(Array(nums[0..<middle]))
        let rightSorted = mergeSort(Array(nums[middle..<nums.count]))
        
        return Sorting.mergeSortedArray(leftSorted, rightSorted)
    }
    
    static func mergeSortedArray(_ nums1: Array<Int>, _ nums2: Array<Int>) -> Array<Int> {
        var p1 = 0
        var p2 = 0
        
        var merged = [Int]()
        
        while p1 < nums1.count, p2 < nums2.count {
            if nums1[p1] < nums2[p2] {
                merged.append(nums1[p1])
                p1 += 1
            } else {
                merged.append(nums2[p2])
                p2 += 1
            }
        }
        
        if p1 >= nums1.count {
            merged += nums2.suffix(from: p2)
        }
        
        if p2 >= nums2.count {
            merged += nums1.suffix(from: p1)
        }
        
        return merged
    }
}
