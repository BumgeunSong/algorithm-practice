//
//  groupAnagrams.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/22.
//

import Foundation

func groupAnagrams(_ strs: [String]) -> [[String]] {
    typealias anagramDict = [[Int]: [String]]
    
    let anaDict = strs.reduce(into: anagramDict()) { partialResult, str in
        let count = countOccurrence(str)
        partialResult[count, default: []] += [str]
    }
    
    return anaDict.values.map { Array($0) }
}

func countOccurrence(_ str: String) -> [Int] {
    return str.reduce(into: Array(repeating: 0, count: 26)) { partialResult, char in
        let index = Int(char.asciiValue! - Character("a").asciiValue!)
        partialResult[index] += 1
    }
}
