//
//  LetterCombinations.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/13.
//

import Foundation

func letterCombinations(_ digits: String) -> [String] {
    if digits.isEmpty { return [] }
    
    let dict: [Int: [String]] = [
        2: ["a","b","c"],
        3: ["d","e","f"],
        4: ["g","h","i"],
        5: ["j","k","l"],
        6: ["m","n","o"],
        7: ["p","q","r","s"],
        8: ["t","u","v"],
        9: ["w","x","y","z"]
    ]
    
    let digits = Array(digits).map { $0.wholeNumberValue! }
    
    return dfs(0, digits: digits, dict: dict)
}

func combination(_ letters1: [String], _ letters2: [String]) -> [String] {
    var result: [String] = []
    for i in letters1.indices {
        for j in letters2.indices {
            result.append(letters1[i] + letters2[j])
        }
    }
    return result
}


func dfs(_ currentDigit: Int, digits: [Int], dict: [Int: [String]]) -> [String] {
    if currentDigit >= digits.count { return [""] }
    
    let letters = dict[digits[currentDigit]]!
    
    return letters.reduce([String]()) { partialResult, letter in
        partialResult + dfs(currentDigit+1, digits: digits, dict: dict).map { letter + $0 }
    }
}
