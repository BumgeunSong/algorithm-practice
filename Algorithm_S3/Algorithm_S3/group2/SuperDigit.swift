//
//  SuperDigit.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/29.
//

import Foundation

func superDigit(n: String, k: Int) -> Int {
    // Write your code here
    func recursion(n: String) -> Int {
        if n.count <= 1 { return Int(n)! }
        return recursion(n: digitSum(n))
    }
    
    return recursion(n: digitSum(n, k))
}

func digitSum(_ n: String, _ k: Int = 1) -> String {
    let sum = n.reduce(0) { partialResult, char in
        partialResult + char.wholeNumberValue!
    } * k
    return "\(sum)"
}
