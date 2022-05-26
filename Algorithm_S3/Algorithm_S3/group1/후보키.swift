//
//  후보키.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/12.
//

import Foundation

func 후보키(_ relation:[[String]]) -> Int {
    var subsets = makeSubsets(Array(0..<relation[0].count)).sorted {
        $0.count < $1.count
    }
    
    var candidateKeyCount = 0
    var i = 0

    while i < subsets.count {
        if isUniqueKey(subsets[i], relation) {
            subsets = subsets.filter { !Set(subsets[i]).isSubset(of: Set($0)) }
            candidateKeyCount += 1
        } else {
            subsets.remove(at: i)
        }
    }
    
    return candidateKeyCount
}



func makeSubsets(_ nums: [Int]) -> [[Int]] {
    if nums.isEmpty { return [[]] }
    let pick = nums[0]
    let subsetsOfRemain = makeSubsets(Array(nums.dropFirst()))
    return subsetsOfRemain.map { $0 + [pick] } + subsetsOfRemain
}


func isUniqueKey(_ indicies: [Int], _ relation: [[String]]) -> Bool {
    if indicies.isEmpty { return false }
    var set = Set<String>()
    for tuple in relation {
        let keyString = indicies.reduce("") { $0 + tuple[$1] }
        set.insert(keyString)
    }
    return relation.count == set.count
}



