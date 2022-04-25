//
//  StringCompression.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/23.
//

import Foundation

func stringCompression(_ s: String) -> Int {
    if s.count <= 2 { return s.count }
    let strArr = Array(s)
    var minLength = s.count
    for length in (1...(s.count/2)) {
        let chunkedStrings = chunked(strArr, into: length)
        let compressed = compressString(chunkedStrings)
        minLength = min(minLength, compressed.count)
    }
    return minLength
}

func chunked(_ str: Array<Character>, into size: Int) -> [String] {
    return stride(from: 0, through: str.count, by: size).map {
        String(str[$0..<min($0+size, str.count)])
    }
}


func compressString(_ array: [String]) -> String {
    var result = ""
    var currentWord = array[0]
    var repeatCount = 0
    
    for str in array {
        if str == currentWord {
            repeatCount += 1
        } else {
            result += repeatCount > 1 ? "\(repeatCount)\(currentWord)" : "\(currentWord)"
            currentWord = str
            repeatCount = 1
        }
    }
    
    result += repeatCount > 1 ? "\(repeatCount)\(currentWord)" : "\(currentWord)"
    
    return result
}

