//
//  leastInterval.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/31.
//

import Foundation

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    if n == 0 { return tasks.count }
    
    let frequency = tasks.reduce(into: [Character: Int]()) { partialResult, char in
        partialResult[char, default: 0] += 1
    }
    
    var heap = Heap(array: Array(frequency.values))
    var queue = [(Int, Int)]()
    
    var index = 1
    while heap.peek != nil {
        if !queue.isEmpty, index >= queue[0].1 {
            heap.insert(queue.removeFirst().1)
        }
        
        var peek = heap.remove()!
        peek -= 1
        
        if peek != 0 { queue.append((peek, index+n+1)) }
        
        index += 1
    }
    
    return index
}
