//
//  Tuple.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/05.
//

import Foundation

func tuple(_ s: String) -> [Int] {
    let dict = tupleDict(s)
    var prev = 0
    var result = [Int]()
    for i in 1...dict.count {
        result.append(dict[i]! - prev)
        prev = dict[i]!
    }
    return result
}

func tupleDict(_ s: String) -> [Int: Int] {
    var result = [Int: Int]()
    var count = 0
    var sum = 0
    var tempString = ""
    var isOutside = true
    for char in s.dropLast().dropFirst() {
        switch char {
        case "{":
            sum = 0
            count = 0
            isOutside = false
        case "}":
            sum += Int(tempString)!
            count += 1
            tempString = ""
            result[count] = sum
            isOutside = true
        case ",":
            if isOutside { continue }
            sum += Int(tempString)!
            count += 1
            tempString = ""
        default:
            tempString += String(char)
        }
    }
    return result
}
