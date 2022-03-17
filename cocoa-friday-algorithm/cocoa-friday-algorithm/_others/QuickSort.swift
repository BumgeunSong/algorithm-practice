//
//  QuickSort.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/03/17.
//

import Foundation

func quickSort<T: Comparable>(_ nums: [T]) -> [T] {
    guard nums.count > 1 else { return nums }
    
    let pivot = nums[Int.random(in: 0..<nums.count)]
    
    let less = nums.filter { $0 < pivot }
    let equal = nums.filter { $0 == pivot }
    let greater = nums.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}
