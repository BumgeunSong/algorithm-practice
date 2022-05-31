//
//  lengthOfLongestSubstring.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/31.
//

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.isEmpty { return 0 }
    if s.count == 1 { return 1 }
    
    let arr = Array(s)
    
    var start = 0
    var end = 1
    var set: Set<Character> = [arr[start]]
    var maxLength = 0
    
    while end < arr.count {
        if set.contains(arr[end]) {
            set.remove(arr[start])
            start += 1
        } else {
            set.insert(arr[end])
            maxLength = max(maxLength, set.count)
            end += 1
        }
    }
    return maxLength
}
