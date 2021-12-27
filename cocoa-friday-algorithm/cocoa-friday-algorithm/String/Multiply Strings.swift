//
//  Multiply Strings.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/26.
//

import Foundation


func multiply(_ num1: String, _ num2: String) -> String {
    if num1 == "0" || num2 == "0" { return "0" }
    
    let num1 = num1.reversed(), num2 = num2.reversed()
    var answer = Array(repeating: 0, count: num1.count + num2.count)
    
    for i in 0..<num1.count {
        for j in 0..<num2.count {
            let sum = num1[num1.index(num1.startIndex, offsetBy: i)].wholeNumberValue! * num2[num2.index(num2.startIndex, offsetBy: j)].wholeNumberValue!
            answer[i+j] += sum % 10
            answer[i+j+1] += sum / 10
        }
    }
    
    for n in 0..<answer.count-1 {
        answer[n+1] += answer[n] / 10
        answer[n] = answer[n] % 10
    }
    
    if answer[answer.count-1] == 0 {
        answer.removeLast()
    }
    
    return answer.reversed().reduce("") { $0 + String($1) }
}
