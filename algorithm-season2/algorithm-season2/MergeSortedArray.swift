//
//  MergeSortedArray.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/03/20.
//

import Foundation

extension Arrays {
    static func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        let nums3 = nums1.prefix(m)
        
        var p1 = 0
        var p2 = 0
        var p3 = 0
        
        while p1 < m + n {
            if p3 >= m {
                nums1[p1] = nums2[p2]
                p2 += 1
            } else if p2 >= n {
                nums1[p1] = nums3[p3]
                p3 += 1
            } else if nums2[p2] <= nums3[p3] {
                nums1[p1] = nums2[p2]
                p2 += 1
            } else {
                nums1[p1] = nums3[p3]
                p3 += 1
            }
            
            p1 += 1
        }
    }
}
