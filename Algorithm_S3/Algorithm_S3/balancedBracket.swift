//
//  balancedBracket.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/25.
//

import Foundation

func isBalanced(s: String) -> String {
    
    var stack = [Character]()
    let bracket = Array(s)
    let open: Set<Character> = ["(", "{", "["]
    let bracketDict: [Character: Character] = [
        ")": "(",
        "}":"{",
        "]":"["
    ]
    
    for i in 0..<bracket.count {
        if open.contains(bracket[i]) {
            if stack.count > s.count-i { return "NO" }
            stack.append(bracket[i])
        } else {
            guard let last = stack.last else { return "NO" }
            if bracketDict[bracket[i]]! != last { return "NO" }
            stack.removeLast()
        }
    }
    
    return stack.isEmpty ? "YES" : "NO"
}
