//
//  intersect.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/19.
//

import Foundation

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let sorted1 = nums1.sorted()
        let sorted2 = nums2.sorted()
        
        var p1 = 0
        var p2 = 0
        
        var results: [Int] = []
        
        while p1 < sorted1.count && p2 < sorted2.count {
            print("p1", p1)
            print("p2", p2)
            print(sorted1)
            print(sorted2)
            if sorted1[p1] > sorted2[p2] {
                p2 += 1
            } else if sorted1[p1] < sorted2[p2] {
                p1 += 1
            } else {
                results.append(sorted1[p1])
                p1 += 1
                p2 += 1
                print(results)
            }
        }
        return results
    }
