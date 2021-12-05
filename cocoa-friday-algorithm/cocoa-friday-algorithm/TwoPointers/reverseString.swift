//
//  reverseString.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/05.
//

import Foundation

func reverseString(_ s: inout [Character]) {
    var p1 = 0
    var p2 = s.count - 1
    
    while p1 <= p2 {
        s.swapAt(p1, p2)
        p1 += 1
        p2 -= 1
    }
}
