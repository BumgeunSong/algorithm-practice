//
//  getLargeNumber.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/18.
//

import Foundation

func getLargeNumber(_ number: String, _ k: Int) -> String {
    let numbers = Array(number).map { $0.wholeNumberValue! }
    var stack = [Int]()
    
    var popCount = 0
    for number in numbers {
        while !stack.isEmpty, popCount < k, stack.last! < number {
            stack.removeLast()
            popCount += 1
        }
        stack.append(number)
    }
    
    return stack.prefix(numbers.count-k).map { String($0) }.joined(separator: "")
}

func getMaxIndex(_ nums: Array<Int>.SubSequence) -> Int {
    var maxNum = 0
    var maxIndex = 0
    
    for (index, num) in nums.enumerated() {
        if maxNum < num {
            maxNum = num
            maxIndex = index
        }
    }
    
    return maxIndex
}
