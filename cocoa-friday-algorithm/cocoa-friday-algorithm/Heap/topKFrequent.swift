//
//  topKFrequent.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/25.
//

import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    let count = nums.reduce(into: [Int: Int]()) { count, num in
        count[num] = (count[num] ?? 0) + 1
    }
    
    let compareValue = { count[$0]! < count[$1]! }
    return count.keys.sorted(by: compareValue).suffix(k)
}
