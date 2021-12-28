//
//  RepeatedDNASequences.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/28.
//

import Foundation


func findRepeatedDnaSequences(_ s: String) -> [String] {
    if s.count < 10 { return [] }
    
    var count = [String: Int](), answer = [String]()
    let seq = Array(s)
    
    for i in 0..<s.count-9 {
        let substring = String(seq[i..<i+10])
        if count[substring] == nil {
            count[substring] = 1
        } else if count[substring] == 1 {
            count[substring]! += 1
            answer.append(substring)
        }
    }
    return answer
}

