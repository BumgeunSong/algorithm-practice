//
//  letterCasePermutation.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/14.
//

import Foundation

func letterCasePermutation(_ s: String) -> [String] {
    if s.count == 1 {
        return s.first!.isLetter ? [s.lowercased(), s.uppercased()] : [s]
    }
    
    var answer = [String]()
    let rest = letterCasePermutation(String(s.dropFirst(1)))
    
    if s.first!.isLetter {
        rest.forEach {
            answer.append(s.first!.lowercased() + $0)
            answer.append(s.first!.uppercased() + $0)
        }
    } else {
        rest.forEach { answer.append(String(s.first!) + $0) }
    }
    return answer
}
