//
//  myPow.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/07/28.
//

import Foundation

func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1
    } else if n > 0 {
        return x * myPow(x, n-1)
    } else {
        let result = 1 / (x * myPow(x, n+1))
        print(result)
        return result
    }
}
