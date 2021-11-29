//
//  MergeTwoArray.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/19.
//

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    let left = nums1.prefix(m)
    let right = nums2
    
    var leftP = 0
    var rightP = 0
    var nums1P = 0
    
    
    while nums1P < m + n {
        var insert = 0
        if leftP >= m {
            insert = right[rightP]
            rightP += 1
        } else if rightP >= n {
            insert = left[leftP]
            leftP += 1
        } else {
            if left[leftP] <= right[rightP] {
                insert = left[leftP]
                leftP += 1
            } else {
                insert = right[rightP]
                rightP += 1
            }
        }
        nums1[nums1P] = insert
        nums1P += 1
    }
}
