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
    var unique = count.map { $0.key }
    
    func partition(_ left: Int, _ right: Int, _ pivotIndex: Int) -> Int {
        let pivotFrequency = count[unique[pivotIndex]]!
        // 1. pivot을 맨 뒤로 옮긴다.
        unique.swapAt(pivotIndex, right)
        
        // 2. Array 맨 앞에 포인터를 설정한다.
        var storeIndex = left
        
        // 3. 전체 배열을 순회한다.
        for index in left...right {
            // 4. 만약 pivot보다 작은 원소면 pointer와 swap하고 pointer을 하나 옮긴다.
            if count[unique[index]]! < pivotFrequency {
                unique.swapAt(storeIndex, index)
                storeIndex += 1
            }
        }
        // 5. 마지막 포인터에 있던 숫자를 맨 뒤로 옮기고 해당 자리를 return한다.
        unique.swapAt(storeIndex, right)
        return storeIndex
    }
    
    func quickSelect(_ left: Int, _ right: Int, _ k: Int) {
        if left == right { return }
        var pivotIndex = Int.random(in: left...right)
        pivotIndex = partition(left, right, pivotIndex)
        
        if pivotIndex == k { return  }
        else if pivotIndex < k { quickSelect(pivotIndex + 1, right, k) }
        else if pivotIndex > k { quickSelect(left, pivotIndex - 1, k) }
    }
    
    quickSelect(0, unique.count-1, unique.count-k)
    return unique.suffix(k)
}




struct FrequencyHeap<T: Comparable & Hashable> {
    var keys: [T] = []
    var frequency: [T: Int] = [:]
    var count: Int { return keys.count }
    var peek: T? {
        return keys.isEmpty ? nil : keys[0]
    }
    
    init(array: [T], frequency: [T: Int]) {
        self.keys = array
        self.frequency = frequency
        for i in stride(from: count/2, through: 0, by: -1) {
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
        guard (0..<count).contains(k) else { return nil }
        return Array(keys[0..<k])
    }
}


