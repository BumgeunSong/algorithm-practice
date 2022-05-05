//
//  maximizeEquation.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/04.
//

import Foundation

func maximizeEquation(_ expression: String) -> Int64 {
    
    let combinations: [[String]] = [
        ["+", "-", "*"],
        ["-", "+", "*"],
        ["-", "*", "+"],
        ["+", "*", "-"],
        ["*", "+", "-"],
        ["*", "-", "+"]]
    
    let separates = separate(expression)
    
    return combinations.map { combination in
        calc(separates, priority: combination)
    }.max()!
}

func calc(_ expression : [String], priority : [String]) -> Int64 {
    var expression = expression
    
    for op in priority {
        while ( expression.contains(op) ) {  // operator가 포함되어 있으면 그 오퍼레이트 실행
            let idx = expression.firstIndex(of: op)!
            let operand = expression.remove(at: idx+1)
            switch op {
            case "+":
                expression[idx-1] = String(Int(expression[idx-1])! + Int(operand)!)
            case "-":
                expression[idx-1] = String(Int(expression[idx-1])! - Int(operand)!)
            default:
                expression[idx-1] = String(Int(expression[idx-1])! * Int(operand)!)
            }
            expression.remove(at: idx)
        }
    }
    return abs(Int64(expression.first!)!)
}

func separate(_ expression : String) -> [String] {
    var tmp = ""
    var result : [String] = []
    for ch in expression {
        let ch = String(ch)
        if ch == "+" || ch == "-" || ch == "*" {
            result.append(tmp)
            tmp = ""
            result.append(ch)
        } else {
            tmp += ch
        }
    }
    result.append(tmp)
    
    return result
}


func resolveAll(_ opers: [Character], _ expression: [(Int64, Character)]) -> Int64 {
    var newExpression = expression
    for oper in opers {
        newExpression = resolve(oper, newExpression)
    }
    return abs(calculate(newExpression[0].0, newExpression[1].0, newExpression[0].1)!)
}

func resolve(_ priority: Character, _ expression: [(Int64, Character)]) ->  [(Int64, Character)] {
    var expression = expression
    for i in 0..<expression.count-1 {
        if expression[i].1 == priority {
            let num = calculate(expression[0].0, expression[1].0, expression[0].1)!
            expression[i] = (num, expression[i+1].1)
            expression.remove(at: i+1)
        }
    }
    return expression
}


func calculate(_ lhs: Int64, _ rhs: Int64, _ oper: Character) -> Int64? {
    switch oper {
    case "+":
        return lhs + rhs
    case "-":
        return lhs - rhs
    case "*":
        return lhs * rhs
    default:
        return nil
    }
}
