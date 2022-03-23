//
//  IntersectionofTwoArrays2.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/03/23.
//

import Foundation

extension Array {
    static func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // 둘다 정렬하고
        // 같은 숫자 나오면 추가한 뒤에 하나씩 뒤로
        // 같은 숫자 아니면 작은 숫자부터 하나씩 뒤로
        let sorted1 = nums1.sorted()
        let sorted2 = nums2.sorted()
        
        var p1 = 0
        var p2 = 0
        
        var results = [Int]()
        
        while p1 < sorted1.count, p2 < sorted2.count {
            if sorted1[p1] == sorted2[p2] {
                results.append(sorted1[p1])
                p1 += 1
                p2 += 1
            } else if sorted1[p1] < sorted2[p2] {
                p1 += 1
            } else {
                p2 += 1
            }
        }
        
        return results
    }
}
