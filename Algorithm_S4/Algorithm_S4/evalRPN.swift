//
//  evalRPN.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/02.
//

import Foundation
import AppKit

func evalRPN(_ tokens: [String]) -> Int {
    var stack = [Int]()
    for token in tokens {
        switch token {
        case "+":
            let operands = stack.removeLast()
            stack[stack.count-1] += operands
        case "-":
            let operands = stack.removeLast()
            stack[stack.count-1] -= operands
        case "*":
            let operands = stack.removeLast()
            stack[stack.count-1] *= operands
        case "/":
            let operands = stack.removeLast()
            stack[stack.count-1] /= operands
        default:
            stack.append(Int(token)!)
        }
    }
    return stack[0]
}
