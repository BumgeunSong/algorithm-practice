//
//  MinStack.swift
//  Algorithm_S4
//
//  Created by 송범근 on 2022/08/04.
//

import Foundation

class MinStack {

    var stack = [Int]()
    var minStack = [Int]()
    
    init() { }
    
    func push(_ val: Int) {
        stack.append(val)
        if minStack.last ?? Int.max >= val {
            minStack.append(val)
        }
    }
    
    func pop() {
        if minStack.last ?? Int.max == stack.removeLast() {
            minStack.removeLast()
        }
    }
    
    func top() -> Int {
        stack.last!
    }
    
    func getMin() -> Int {
        minStack.last!
    }
}
