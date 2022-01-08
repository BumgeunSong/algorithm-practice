//
//  minRemoveToMakeValid.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/08.
//

import Foundation

func minRemoveToMakeValid(_ s: String) -> String {
    var openerIndexStack: [Int] = []
    var closerIndexStack: [Int] = []
    var parenthesesStack: [Character] = []
    
    var stringArray = Array(s)
    var isValid = true
    
    for (index, char) in stringArray.enumerated() {
        if char == "(" {
            parenthesesStack.append(char)
            openerIndexStack.append(index)
        } else if char == ")" {
            if parenthesesStack.last != nil {
                parenthesesStack.removeLast()
            } else {
                isValid = false
                closerIndexStack.append(index)
            }
        }
    }
    
    if !parenthesesStack.isEmpty {
        isValid = false
    }
    
    if !isValid {
        while !closerIndexStack.isEmpty {
            stringArray[closerIndexStack.removeLast()] = "0"
        }
        
        while !parenthesesStack.isEmpty {
            parenthesesStack.removeLast()
            stringArray[openerIndexStack.removeLast()] = "0"
        }
    }
    return String(stringArray.filter { $0 != "0"})
}
