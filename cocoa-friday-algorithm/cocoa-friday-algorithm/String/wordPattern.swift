//
//  wordPattern.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/24.
//

import Foundation

func wordPattern(_ pattern: String, _ s: String) -> Bool {
    
    let words = s.components(separatedBy: " ")
    let pattern = Array(pattern)
    
    if words.count != pattern.count { return false }
    
    var count = [Character: String]()
    
    for i in 0..<pattern.count {
        if count[pattern[i]] == nil {
            if count.values.contains(words[i]) { return false }
            else { count[pattern[i]] = words[i] }
        } else if count[pattern[i]] != words[i] { return false }
    }
    return true
}

