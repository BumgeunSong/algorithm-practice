//
//  CoinChange.swift
//  Algorithm_S4
//
//  Created by 송범근 on 2022/08/04.
//

import Foundation

func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
    
    
    func fewestCoins(_ coins: ArraySlice<Int>, _ amount: Int, _ numOfCoins: Int) -> Int {
        if coins.isEmpty {
            if amount == 0 { return numOfCoins }
            else { return Int.max }
        }
        
        let max = amount / coins.first!
        let candidate = (0...max).map {
            fewestCoins(coins.dropFirst(), amount - ($0 * coins.first!), numOfCoins + $0)
        }
        return candidate.min()!
    }
    
    let result = fewestCoins(ArraySlice(coins), amount, 0)
    
    return result == Int.max ? -1 : result
}

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    
    var memo = Array(repeating: amount+1, count: amount+1)
    memo[0] = 0
    
    for amount in (1..<amount+1) {
        for coin in coins where amount >= coin {
            memo[amount] = min(memo[amount], memo[amount-coin] + 1)
        }
    }
    
    return memo[amount] == amount+1 ? -1 : memo[amount]
}
