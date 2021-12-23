//
//  longestPalindrome.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/23.
//

import Foundation

func longestPalindrome(_ s: String) -> Int {
    let count = s.reduce(into: [Character: Int]()) { partialResult, letter in
        partialResult[letter] = (partialResult[letter] ?? 0) + 1
    }
    
    var length = 1
    
    for key in count.keys {
        length += (count[key]! / 2) * 2
    }
    
    return length
}
