//
//  maxProfit.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/31.
//

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var minPrice = prices[0]
    var maxProfit = 0
    
    for price in prices {
        minPrice = min(price, minPrice)
        maxProfit = max(price - minPrice, maxProfit)
    }
    
    return maxProfit
}
