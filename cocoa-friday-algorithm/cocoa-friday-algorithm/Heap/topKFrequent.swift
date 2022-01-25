//
//  topKFrequent.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/25.
//

import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    let count: (([Int]) -> [Int: Int]) = { $0.reduce(into: [Int: Int]()) { count, num in
        count[num] = (count[num] ?? 0) + 1
    }}
    
    var heap = FrequencyHeap<Int>(frequency: count(nums))
    return heap.peeks(k: k) ?? []
    
}

struct FrequencyHeap<T: Comparable & Hashable> {
    var keys: [T] = []
    var frequency: [T: Int] = [:]
    var count: Int { return keys.count }
    var peek: T? {
        return keys.isEmpty ? nil : keys[0]
    }
    
    init(frequency: [T: Int]) {
        self.keys = Array(frequency.keys)
        self.frequency = frequency
        for i in stride(from: count/2-1, through: 0, by: -1) {
            heapifyDown(i)
        }
    }
    
    mutating func heapifyDown(_ index: Int) {
        let left = getleftChildIndex(of: index)
        let right = getRightChildIndex(of: index)
        
        var top = index
        if left < count && frequency[keys[left]]! > frequency[keys[top]]! {
            top = left
        }
        if right < count && frequency[keys[right]]! > frequency[keys[top]]! {
            top = right
        }
        if top == index { return }
        keys.swapAt(index, top)
        heapifyDown(index)
    }
    
    
    func getleftChildIndex(of index: Int) -> Int {
        return (index * 2) + 1
    }
    func getRightChildIndex(of index: Int) -> Int {
        return (index * 2) + 2
    }
    func getParentIndex(of index: Int) -> Int {
        return index / 2
    }
    
    mutating func peeks(k: Int) -> [T]? {
        guard !keys.isEmpty else { return nil }
        return Array(keys[0..<k])
    }
}
