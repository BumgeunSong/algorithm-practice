//
//  backspaceCompare.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/02.
//

import Foundation

func backspaceCompare(_ s: String, _ t: String) -> Bool {
    let finalS = s.reduce(into: [Character]()) { stack, char in
        if char == "#" {
            if !stack.isEmpty { stack.removeLast() }
        } else {
            stack.append(char)
        }
    }
    
    let finalT = t.reduce(into: [Character]()) { stack, char in
        if char == "#" {
            if !stack.isEmpty { stack.removeLast() }
        } else {
            stack.append(char)
        }
    }
    
    return finalS == finalT
}
