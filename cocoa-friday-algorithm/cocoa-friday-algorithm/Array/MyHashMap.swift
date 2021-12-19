//
//  MyHashMap.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/19.
//

import Foundation

class MyHashMap {
    private var hashmap: Array<Int?>
    
    init() {
        self.hashmap = Array(repeating: nil, count: 100)
    }
    
    func put(_ key: Int, _ value: Int) {
        while key >= hashmap.count {
            hashmap += Array(repeating: nil, count: 100)
        }
        hashmap[key] = value
    }
    
    func get(_ key: Int) -> Int {
        return (hashmap[key] ?? -1)
    }
    
    func remove(_ key: Int) {
        hashmap[key] = nil
    }
}
