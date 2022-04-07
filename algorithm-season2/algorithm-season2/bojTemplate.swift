//
//  bojTemplate.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/01.
//

import Foundation

func readInput() {
    
    let n = Int(readLine()!)!
    
    let prices = [0] + readLine()!.components(separatedBy: " ").map { Int($0)! }
    
    var discounts = [Int: [[Int]]]()
    
    for i in 0..<n {
        let p1 = Int(readLine()!)!
        for _ in 0..<p1 {
            let lineArr = readLine()!.components(separatedBy: " ").map { Int($0)! }
            discounts[i+1, default: [[Int]]()] += [lineArr]
        }
    }
    
    potion(prices: prices, discounts: discounts)
}
