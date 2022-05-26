//
//  QueueTwoStacks.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/25.
//

import Foundation

struct Dequeue {
    var headStack = [Int]()
    var tailStack = [Int]()
    
    mutating func add(_ x: Int) {
        tailStack.append(x)
    }
    
    @discardableResult
    mutating func remove() -> Int {
        if headStack.isEmpty {
            while !tailStack.isEmpty {
                headStack.append(tailStack.removeLast())
            }
        }
        return headStack.removeLast()
    }
    
    func print() {
        if headStack.isEmpty {
            Swift.print(tailStack[0])
        } else {
            Swift.print(headStack[headStack.count-1])
        }
    }
}

func parseOperation() -> [[String]] {
    var result = [[String]]()
    let numOfLine = Int(readLine()!)!
    for _ in 0..<numOfLine {
        let line = readLine()!.components(separatedBy: " ")
        if line[0] == "1" {
            result.append([line[0], line[1]])
        } else {
            result.append([line[0]])
        }
    }
    return result
}

func perform(_ operations: [[String]]) {
    var dequeue = Dequeue()
    for operation in operations {
        switch operation[0] {
        case "1": dequeue.add(Int(operation[1])!)
        case "2": dequeue.remove()
        case "3": dequeue.print()
        default:
            break
        }
    }
}
