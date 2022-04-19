//
//  makePrimeNumber.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/18.
//

import Foundation

// https://programmers.co.kr/learn/courses/30/lessons/12977

func makePrimeNumber(_ nums: [Int]) -> Int {
    
    func takeout(flags: [Bool], prime: Int) -> [Bool] {
        var flags = flags
        for i in stride(from: prime * prime, to: flags.count, by: prime) {
            flags[i] = false
        }
        return flags
    }
    
    func getNextPrime(flags: [Bool], prime: Int) -> Int {
        for i in prime+1..<flags.count {
            if flags[i] == true { return i }
        }
        return flags.count
    }
    
    let candidates = getCombinationSum(nums, 3)
    let max = candidates.max()!
    
    var flags = Array(repeating: true, count: max+1)
    flags[0] = false
    flags[1] = false
    
    var next = 2
    while next < flags.count {
        flags = takeout(flags: flags, prime: next)
        next = getNextPrime(flags: flags, prime: next)
    }
    
    return candidates.filter { flags[$0] == true }.count
    
}

func getCombinationSum(_ nums: [Int], _ r: Int) -> [Int] {
    if r > nums.count { return [] }
    if r == 0 { return [0] }
    if r == nums.count { return [nums.reduce(0, +)] }
    
    let fix = nums[0]
    let remain = Array(nums.dropFirst())
    let subcombo = getCombinationSum(remain, r-1)
    let subcombo2 = getCombinationSum(remain, r)
    
    return subcombo.map { fix + $0 } + subcombo2
}
