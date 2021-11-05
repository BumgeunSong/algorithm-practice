//
//  p1000.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation

struct Problem1000 {
    
    func simpleStart() {
        let input = readLine(strippingNewline: true)?.components(separatedBy: " ") ?? []
        if let a = Int(input[0]), let b = Int(input[1]) {
            print(a + b)
        }
    }
    
    func getInput() -> [Int] {
        let input = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ") ?? []
        var array: [Int] = []
        for element in input {
            if let num = Int(element) {
                array.append(num)
            }
        }
        return array
    }
    
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func printOutput() {
        let input = getInput()
        if input.count == 2 {
            print(add(input[0], input[1]))
        } else {
            print("You should enter two number with space.")
            printOutput()
        }
        
    }
}

