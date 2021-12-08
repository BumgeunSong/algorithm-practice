//
//  lengthOfLongestSubstring.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/08.
//

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count < 2 { return s.count }
    
    var start = 0
    var maxlength = 0
    var count: [Character: Int] = [:]
    
    for (end, char) in s.enumerated() {
        if let charIndex = count[char], charIndex >= start {
            start = charIndex + 1
        }
        count[char] = end
        maxlength = max(maxlength, end - start + 1)
    }
    return maxlength
}

