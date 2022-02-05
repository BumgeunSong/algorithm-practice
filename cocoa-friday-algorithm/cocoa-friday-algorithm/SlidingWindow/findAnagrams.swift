//
//  findAnagrams.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/05.
//

import Foundation

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    if s.count < p.count { return [] }
    
    let base = Character("a").asciiValue!
    let p = Array(p), s = Array(s)
    
    let pCount = p.reduce(into: Array(repeating: 0, count: 26)) {
        $0[Int($1.asciiValue! - base)] += 1
    }
    var sCount = s.prefix(p.count).reduce(into: Array(repeating: 0, count: 26)) {
        $0[Int($1.asciiValue! - base)] += 1
    }
    
    var result = [Int]()
    if pCount == sCount { result.append(0) }
    
    for i in 0..<s.count-p.count {
        let windowOut = s[i]
        sCount[Int(windowOut.asciiValue! - base)] -= 1
        
        let windowIn = s[i + p.count]
        sCount[Int(windowIn.asciiValue! - base)] += 1
        
        if pCount == sCount { result.append(i+1) }
    }
    
    return result
}
