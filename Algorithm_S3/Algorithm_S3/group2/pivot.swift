//
//  pivot.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/28.
//

import Foundation

func balancedSum(arr: [Int]) -> Int {
    
    var sum = 0
    var partialSum = [Int]()
    for num in arr {
        sum += num
        partialSum.append(sum)
    }
    
    for i in 1..<partialSum.count-1 {
        let r = partialSum[partialSum.count-1] - partialSum[i]
        let l = partialSum[i-1]
        if l == r { return i }
    }
    return 0
}
