//
//  sortedArrayToBST.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/09.
//  108. Convert Sorted Array to Binary Search Tree

import Foundation

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    if nums.count == 0 { return nil }
    if nums.count == 1 { return TreeNode(nums[0]) }
    
    let midIndex = nums.count / 2
    return TreeNode(nums[midIndex], sortedArrayToBST(Array(nums[0..<midIndex])), sortedArrayToBST(Array(nums[midIndex+1..<nums.count])))
}
