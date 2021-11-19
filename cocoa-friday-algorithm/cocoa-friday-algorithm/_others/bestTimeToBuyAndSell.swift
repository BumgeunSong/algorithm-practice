//
//  bestTimeToBuyAndSell.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/19.
//

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var profit = 0
    var minPrice = Int.max
    
    for i in 0..<prices.count {
        if prices[i] < minPrice {
            minPrice = prices[i]
        } else if (prices[i] - minPrice) > profit {
            profit = prices[i] - minPrice
        }
    }
    return profit
}
