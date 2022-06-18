//
//  topKFrequent.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/16.
//

import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    let count = nums.reduce(into: [Int: Int]()) { partialResult, num in
        partialResult[num, default: 0] += 1
    }
    
    let tuples: [(key: Int, value: Int)] = count.map { ($0.key, $0.value) }
    
    return moreThanK.map { $0.0 }
}

func quickSelectIndex(_ nums: [(Int: Int)], _ k: Int) -> Int {
    let pivot = nums[Int.random(in: nums.indices)]
    let less = nums.filter { $0.1 < pivot.1 }
    let same = nums.filter { $0.1 == pivot.1 }
    let more = nums.filter { $0.1 > pivot.1 }
    
    // 기준점
    // 0 ~ more.count ~ more.count + same.count ~ nums.count
    let leftBound = more.count
    let rightBound = more.count + same.count
    
    // k번째 큰 수 = k-1 인덱스에 있는 수
    
    if (0..<leftBound) ~= k-1 {
        return quickSelectIndex(more, k)
    } else if (rightBound..<nums.count) ~= k-1 {
        return quickSelectIndex(less, k - rightBound)
    } else {
        return pivot.0
    }
}





func quickSelect_smallest(_ nums: [Int], _ k: Int) -> Int {
    let pivot = nums[Int.random(in: nums.indices)]
    let less = nums.filter { $0 < pivot }
    let same = nums.filter { $0 == pivot }
    let more = nums.filter { $0 > pivot }
    
    // 기준점
    // 0 - less.count - less.count + same.count - nums.count
    let leftBound = less.count
    let rightBound = less.count + same.count
    
    // k번째 큰 수 = k-1 인덱스에 있는 수
    
    if (0..<leftBound) ~= k-1 {
        return quickSelect_smallest(less, k)
    } else if (rightBound..<nums.count) ~= k-1 {
        return quickSelect_smallest(more, k - rightBound)
    } else {
        return pivot
    }
}

func quickSelect_largest(_ nums: [Int], _ k: Int) -> Int {
    let pivot = nums[Int.random(in: nums.indices)]
    let less = nums.filter { $0 < pivot }
    let same = nums.filter { $0 == pivot }
    let more = nums.filter { $0 > pivot }
    
    // 기준점
    // 0 ~ more.count ~ more.count + same.count ~ nums.count
    let leftBound = more.count
    let rightBound = more.count + same.count
    
    // k번째 큰 수 = k-1 인덱스에 있는 수
    
    if (0..<leftBound) ~= k-1 {
        return quickSelect_largest(more, k)
    } else if (rightBound..<nums.count) ~= k-1 {
        return quickSelect_largest(less, k - rightBound)
    } else {
        return pivot
    }
}
