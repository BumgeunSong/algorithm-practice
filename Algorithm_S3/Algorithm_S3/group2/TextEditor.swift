//
//  TextEditor.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/30.
//

import Foundation

struct Editor {
    var string = [Character]()
    var stack = [[Character]]()
    
    mutating func append(_ s: String) {
        stack.append(string)
        string += Array(s)
    }
    
    mutating func delete(_ k: Int) {
        stack.append(string)
        string.removeLast(k)
    }
    
    func printChar(_ k: Int) {
        print(string[k-1])
    }
    
    mutating func undo() {
        string = stack.removeLast()
    }
}

func parseInput() {
    let number = Int(readLine()!)!
    
    let operations = (0..<number).map { _ in
        return readLine()!.components(separatedBy: " ")
    }
    
    var editor = Editor()
    for operation in operations {
        switch operation[0] {
        case "1": editor.append(operation[1])
        case "2": editor.delete(Int(operation[1])!)
        case "3": editor.printChar(Int(operation[1])!)
        case "4": editor.undo()
        default: break
        }
    }
}

