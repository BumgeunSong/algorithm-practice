//
//  isPossible.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/28.
//

import Foundation

func isPossible(a: Int, b: Int, c: Int, d: Int) -> String {
    // Write your code here
    
    func search(a: Int, b: Int) -> Bool {
        if a > c, b > d { return false }
        if a == c, b == d { return true }
        print("a: \(a), b: \(b)")
        
        var result = false
        if a < c { result = result || search(a: a+b, b: b) }
        if b < d { result = result || search(a: a, b: a+b) }
        return result
    }

    return search(a: a, b: b) ? "YES" : "NO"
}

