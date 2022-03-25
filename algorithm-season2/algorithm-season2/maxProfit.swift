//
//  maxProfit.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/03/25.
//

import Foundation

extension Array {
    static func maxProfit(_ prices: [Int]) -> Int {
        var globalMax = 0
        var localMax = 0
        
        for i in 1..<prices.count {
            let diff = prices[i] - prices[i-1]
            localMax = max(localMax + diff, 0)
            globalMax = max(globalMax, localMax)
        }
        
        return globalMax
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        var minPrice = prices[0]
            
        for i in 0..<prices.count {
            minPrice = min(minPrice, prices[i])
            profit = max(profit, prices[i] - minPrice)
        }
        
        return profit
    }
}
