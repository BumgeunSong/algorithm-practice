//
//  targetNumber.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/07.
//

import Foundation

func targetNumber(_ numbers: [Int], _ target: Int) -> Int {
    
    func dfs(_ numbers: [Int], _ sum: Int) -> Int {
        if numbers.isEmpty { return target == sum ? 1 : 0 }
        
        var newNumbers = numbers
        let num = newNumbers.removeFirst()
        return dfs(newNumbers, sum + num) + dfs(newNumbers, sum - num)
    }
    
    return dfs(numbers, 0)
}
