//
//  HappyNumbers.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/03/10.
//

import Foundation

func isHappy(_ n: Int) -> Bool {
    var sum = n
    var container:Set<Int> = []
    while (sum != 1) {
        if(container.contains(sum)) {
            return false
        }
        container.insert(sum)
        sum = getSumOfSquareOfDigits(sum)
    }
    return true
}

func getSumOfSquareOfDigits(_ num:Int) ->Int {
    var sum = 0
    var number = num
    while (number > 0) {
        sum = sum + (number % 10) * (number % 10)
        number = number/10
    }
    return sum
}
