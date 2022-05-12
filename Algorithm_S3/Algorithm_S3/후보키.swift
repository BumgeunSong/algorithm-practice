//
//  후보키.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/12.
//

import Foundation

func 후보키(_ relation:[[String]]) -> Int {
    let subsets = subsets(Array(0..<relation[0].count))
    print(subsets)
    print("unique & minmal", subsets.filter { isMinimalKey($0, relation) })
    return subsets.filter { isMinimalKey($0, relation) }.count
}

func subsets(_ nums: [Int]) -> [[Int]] {
    if nums.isEmpty { return [[]] }
    let pick = nums[0]
    let subsetsOfRemain = subsets(Array(nums.dropFirst()))
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

func isMinimalKey(_ indicies: [Int], _ relation: [[String]]) -> Bool {
    if indicies.isEmpty { return false }
    let remain = Array(indicies.dropFirst())
    
    return isUniqueKey(indicies, relation) && !isMinimalKey(remain, relation)
}

func filterSuperSet(_ indicies: [[Int]]) {
    
}


