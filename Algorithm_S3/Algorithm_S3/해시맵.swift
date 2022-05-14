//
//  해시맵.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/14.
//

//import Foundation

class MyHashMap {
    
    private var buckets: [Int] = []
    
    init() {
        buckets.reserveCapacity(1_000_000)
    }
    
    func put(_ key: Int, _ value: Int) {
        if key >= buckets.count {
            buckets += Array(repeating: -1, count: key - buckets.count + 1)
        }
        buckets[key] = value
    }
    
    func get(_ key: Int) -> Int {
        guard key < buckets.count else { return -1 }
        return buckets[key]
    }
    
    func remove(_ key: Int) {
        guard key < buckets.count else { return }
        buckets[key] = -1
    }
}
