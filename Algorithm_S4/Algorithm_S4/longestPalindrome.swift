//
//  longestPalindrome.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/31.
//

import Foundation

func longestPalindrome(_ s: String) -> Int {
    let count = s.reduce(into: [Character: Int]()) { partialResult, char in
        partialResult[char, default: 0] += 1
    }
    
    var center = 0
    var length = 0
    for value in count.values {
        if value.isMultiple(of: 2) {
            length += value
        } else {
            length += value-1
            center = 1
        }
    }
    return length + center
}
