//
//  MinStack.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/08.
//

import Foundation

class MinStack {
    
    var minStack = [Int.max]
    var stack: [Int] = []
        
    init() {
        
    }
    
    func push(_ val: Int) {
        if minStack.last! >= val {
            minStack.append(val)
        }
        stack.append(val)
    }
    
    func pop() {
        let last = stack.removeLast()
        if minStack.last! == last {
            minStack.removeLast()
        }
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return minStack.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
