//
//  Count Special Quadruplets.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/05.
//

import Foundation

func countQuadruplets(_ nums: [Int]) -> Int {
    let candidate = getCombo(Array((0..<nums.count)), k: 4)
    
    return candidate.filter { isQuadplets(nums, indices: $0) }.count
}

func getCombo(_ nums: [Int], k: Int) -> [[Int]] {
    if nums.count < k { return [] }
    if k == 0 { return [[]] }
    if nums.count == k { return [nums] }
    
    let fix = nums[0]
    let remain = Array(nums.dropFirst())
    // 자기 자신을 pick
    let withPick = getCombo(remain, k: k-1)
    let withoutPick = getCombo(remain, k: k)
    return withPick.map { [fix] + $0 } + withoutPick
}

func isQuadplets(_ nums: [Int], indices: [Int]) -> Bool {
    return nums[indices[0]] + nums[indices[1]] + nums[indices[2]] == nums[indices[3]]
}
