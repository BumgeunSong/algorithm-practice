//
//  twoSum_sortedArray.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/04.
//

import Foundation

func twoSumInputSorted(_ numbers: [Int], _ target: Int) -> [Int] {
    
    var p1 = 0
    var p2 = numbers.count - 1
    
    while p1 <= p2 {
        if numbers[p1] + numbers[p2] < target {
            p1 += 1
        } else if numbers[p1] + numbers[p2] > target {
            p2 -= 1
        } else {
            break
        }
    }
    return [p1 + 1, p2 + 1]
    
}
