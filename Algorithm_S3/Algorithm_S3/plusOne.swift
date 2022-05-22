//
//  plusOne.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/22.
//

import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    for i in (0..<digits.count).reversed() {
        if digits[i] == 9 {
            digits[i] = 0
        } else {
            digits[i] += 1
            return digits
        }
    }
    return digits[0] == 0 ? [1] + digits : digits
}
