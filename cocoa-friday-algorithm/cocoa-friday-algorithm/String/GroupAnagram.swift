//
//  GroupAnagram.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/26.
//

import Foundation

func groupAnagrams(_ strs: [String]) -> [[String]] {
    let anagrams = strs.reduce(into: [[Character]: [String]]()) { partialResult, str in
        let sortedStr = str.sorted()
        partialResult[sortedStr] = (partialResult[sortedStr] ?? []) + [str]
    }
    return Array(anagrams.values)
}
