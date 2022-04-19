//
//  Subset.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/19.
//

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
    if nums.isEmpty { return [[]] }
    let pick = nums[0]
    let subsetsOfRemain = subsets(Array(nums.dropFirst()))
    return subsetsOfRemain.map { $0 + [pick] } + subsetsOfRemain
}

func subsetsWitDup(_ nums: [Int]) -> [[Int]] {
    if nums.isEmpty { return [[]] }
    let fix = nums[0]
    let remain = Array(nums.dropFirst())
    let subsetsOfRemain = subsetsWitDup(remain)
    
    let maxNumOfPrefix = remain.filter { $0 == fix }.count
    let subsetsOfRemainWithMaxFix = subsetsOfRemain.filter {
        $0.filter { $0 == fix }.count == maxNumOfPrefix
    }
    
    return subsetsOfRemainWithMaxFix.map { $0 + [fix] } + subsetsOfRemain
}

func getCombination(_ nums: [Int], k: Int) -> [[Int]] {
    if k > nums.count { return [] }
    if k == 0 { return [[]] }
    if k == nums.count { return [nums] }
    
    let fix = nums[0]
    let remain = Array(nums.dropFirst())
    let subcombo = getCombination(remain, k: k-1)
    let subcombo2 = getCombination(remain, k: k)
    
    return subcombo.map { [fix] + $0 } + subcombo2
}

func combos<T>(_ elements: ArraySlice<T>, k: Int) -> [[T]] {
    if k == 0 {
        return [[]]
    }

    guard let first = elements.first else {
        return []
    }

    let head = [first]
    let subcombos = combos(elements, k: k - 1)
    var ret = subcombos.map { head + $0 }
    ret += combos(elements.dropFirst(), k: k)

    return ret
}

func combos<T>(_ elements: Array<T>, k: Int) -> [[T]] {
    return combos(ArraySlice(elements), k: k)
}
