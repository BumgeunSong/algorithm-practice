//
//  isSubsquence.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/30.
//

import Foundation

func isSubsequence(_ s: String, _ t: String) -> Bool {
    if s.isEmpty { return true }
    var p1 = 0, p2 = 0
    let sArr = Array(s)
    let tArr = Array(t)
    
    
    while p2 < tArr.count {
        if sArr[p1] == tArr[p2] { p1 += 1 }
        if p1 >= sArr.count { return true }
        p2 += 1
    }
    
    return false
}
