//
//  checkInclusion.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/08.
//

import Foundation

func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    
    var s1count = Array(repeating: 0, count: 26)
    
    Array(s1).forEach { char in
        let index = Int(char.asciiValue! - Character("a").asciiValue!)
        s1count[index] += 1
    }
    
    var s2count = Array(repeating: 0, count: 26)
    let s2Array = Array(s2)
    
    var start = 0
    
    for (end, char) in s2Array.enumerated() {
        let index = Int(char.asciiValue! - Character("a").asciiValue!)
        s2count[index] += 1
        
        if end >= s1.count {
            let index = Int(s2Array[start].asciiValue! - Character("a").asciiValue!)
            s2count[index] -= 1
            start += 1
        }
        print(end - start + 1)
        if s1count == s2count { return true }
    }
    return false
}
