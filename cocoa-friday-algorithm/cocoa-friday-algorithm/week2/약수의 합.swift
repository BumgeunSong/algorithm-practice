//
//  약수의 합.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/13.
//

import Foundation

func sumDivisor(_ n:Int) -> Int {
    if n <= 1 {
        return n
    }
    
    var sum = 0
    for divisor in 1...n {
        if n % divisor == 0 {
            sum += divisor
        }
    }
    return sum
}
