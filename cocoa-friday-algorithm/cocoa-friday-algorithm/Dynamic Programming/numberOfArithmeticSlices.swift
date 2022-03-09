//
//  numberOfArithmeticSlices.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/03/09.
//

import Foundation


func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
    if nums.count < 3 { return 0 }
    
    var numOfArithmetic = 0
    var lastDiff = nums[1]-nums[0]
    var sameCount = 0
    
    for i in 2..<nums.count {
        let newDiff = (nums[i]-nums[i-1])
        sameCount = lastDiff == newDiff ? sameCount+1 : 0
        numOfArithmetic += sameCount
        lastDiff = newDiff
    }
    
    return numOfArithmetic
}
