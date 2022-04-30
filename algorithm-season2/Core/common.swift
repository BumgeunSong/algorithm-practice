//
//  common.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/30.
//

import Foundation

func squareRoot(num: Double) -> Double {
    return sqrt(num)
}

func binaryToDecimal(binary: String) -> Int {
    let decimal = Int(binary, radix: 2)!
    return decimal
}

func decimalToBinary(int: Int) -> String {
    return String(int, radix: 2)
}

func roundup() {
    print(ceil(6.3))
    print(floor(4.0))
    print(round(4.1))
}

