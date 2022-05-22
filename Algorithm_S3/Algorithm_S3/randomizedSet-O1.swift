//
//  randomizedSet-O1.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/22.
//

import Foundation

class RandomizedSet {

    var set = Set<Int>()
    
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        
        if set.contains(val) {
            return false
        } else {
            set.insert(val)
            return true
        }
    }
    
    func remove(_ val: Int) -> Bool {
        if set.contains(val) {
            set.remove(val)
            return true
        } else {
            return false
        }
    }
    
    func getRandom() -> Int {
        return set.randomElement()!
    }
}
