//
//  MenuRenewal.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/30.
//

import Foundation

func getSubset(str: String, r: Int) -> [String] {
    // 베이스: 배열의 길이가 더 짧을 때 : nothing
    if str.count < r { return [] }
    // 베이스: 배열 길이와 r이 같을 때
    if str.count == r { return [str] }
    // 베이스: r이 0일 때
    if r == 0 { return [""] }
    
    let fix = String(str[str.startIndex])
    let remain = String(str.dropFirst())
    let subcombo = getSubset(str: remain, r: r-1)
    let subcombo2 = getSubset(str: remain, r: r)
    
    return subcombo.map { fix + $0 } + subcombo2
}

func getMostFrequentCombo(orders: [String], r: Int) -> [String] {
    
    let subsets = orders.reduce([String]()) { partialResult, order in
        let sortedOrder = String(order.sorted())
        return partialResult + getSubset(str: sortedOrder, r: r)
    }
    
    let count = subsets.reduce(into: [String:Int]()) { partialResult, subset in
        partialResult[subset, default: 0] += 1
    }
    
    guard let maxCount = count.values.max(), maxCount >= 2 else {
        return []
    }
    
    return count.keys.sorted().filter { count[$0] == maxCount }
}

func getMenu(_ orders: [String], _ course: [Int]) -> [String] {
    return course.reduce(into: [String]()) { partialResult, course in
        partialResult += getMostFrequentCombo(orders: orders, r: course)
    }.sorted()
}
