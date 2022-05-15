//
//  HashTable.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/18.
//

import Foundation

struct HashTable<Key: Hashable, Value> {
    typealias Element = (key: Key, value: Value)
    typealias Bucket = [Element]
    
    private var buckets: [Bucket]
    public var count = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    init(capacity: Int) {
        buckets = Array<Bucket>(repeating: [], count: capacity)
    }
    
    func index(for key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }	
    
    // Search
    subscript(key: Key) -> Value? {
        get {
            buckets[index(for: key)].first { $0.key == key }?.value
        }
        set {
            if let value = newValue {
                update(value: value, for: key)
            }
        }
    }
    
    // Insert
    mutating func update(value: Value, for key: Key) {
        let index = self.index(for: key)
        
        if let i = buckets[index].firstIndex(where: { $0.key == key }) {
            buckets[index][i].value = value
        } else {
            buckets[index].append((key, value))
        }
        self.count += 1
    }
    
}
