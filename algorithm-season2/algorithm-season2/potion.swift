//
//  potion.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/02.
//

import Foundation

func potion(prices: [Int], discounts: [Int: [[Int]]]) {
    var minSum = prices.reduce(0, +)
    let visited = Array(repeating: false, count: prices.count)
    
    func dfs(_ root: Int, prices: [Int], currentSum: Int, visited: [Bool]) {
        var visited = visited
        visited[root] = true
        
        let toVisits = Array(1..<prices.count).filter { node in !visited[node] }
        
        // 순회 완료. 여태까지 할인받는 가격을 다 더해서 minSum에 업데이트
        if toVisits.isEmpty {
            minSum = min(minSum, currentSum + prices[root])
            return
        }
        
        // 순회 안 끝남. 현재 노드와 관련된 디스카운트 전부 적용.
        var prices = prices
        if let discounts = discounts[root] {
            for discount in discounts {
                prices[discount[0]] = max(1, prices[discount[0]] - discount[1])
            }
        }
        
        for toVisit in toVisits {
            if currentSum + prices[root] > minSum { continue }
            dfs(toVisit, prices: prices, currentSum: currentSum + prices[root], visited: visited)
            
        }
    }
    
    for root in 1..<prices.count {
        dfs(root, prices: prices, currentSum: 0, visited: visited)
    }
    
    print(minSum)
}
